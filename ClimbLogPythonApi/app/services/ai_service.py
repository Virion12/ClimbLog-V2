from transformers import AutoTokenizer, AutoModelForCausalLM, BitsAndBytesConfig, StoppingCriteria, StoppingCriteriaList
import torch
import logging
import json
import re

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


class JSONStoppingCriteria(StoppingCriteria):
    """Zatrzymaj generowanie gdy JSON jest kompletny (wszystkie nawiasy zamknięte)"""
    def __init__(self, tokenizer):
        self.tokenizer = tokenizer
        self.open_braces = 0
        self.started = False
        
    def __call__(self, input_ids, scores, **kwargs):
        generated_text = self.tokenizer.decode(input_ids[0], skip_special_tokens=True)
        
        self.open_braces = 0
        self.started = False
        
        for char in generated_text:
            if char == '{':
                self.started = True
                self.open_braces += 1
            elif char == '}':
                self.open_braces -= 1
                

        if self.started and self.open_braces == 0:
            logger.info("JSON kompletny - zatrzymuję generowanie")
            return True
            
        return False


def extract_and_validate_json(text: str) -> tuple[str, bool]:
    """
    Wyciąga i waliduje JSON z odpowiedzi modelu.
    Returns: (cleaned_json_string, is_valid)
    """
    text = re.sub(r'```json\s*', '', text)
    text = re.sub(r'```\s*', '', text)
    text = text.strip()
    
    start = text.find('{')
    end = text.rfind('}')
    
    if start == -1 or end == -1:
        logger.warning("Nie znaleziono nawiasów JSON w odpowiedzi")
        return text, False
    
    json_str = text[start:end+1]
    
    try:
        parsed = json.loads(json_str)
        logger.info("Poprawny JSON")
        
        if "name" not in parsed or "workoutDays" not in parsed:
            logger.warning("JSON nie zawiera wymaganych pól (name, workoutDays)")
            return json_str, False
            
        return json_str, True
    except json.JSONDecodeError as e:
        logger.warning(f"Błąd parsowania JSON: {e}")
        return json_str, False


class AIService:
    def __init__(self):
        logger.info("Ładuję Mistral-7B-Instruct-v0.2...")
        
        quantization_config = BitsAndBytesConfig(
            load_in_4bit=True,
            bnb_4bit_compute_dtype=torch.float16,
            bnb_4bit_use_double_quant=True,
            bnb_4bit_quant_type="nf4"
        )
        
        model_name = "mistralai/Mistral-7B-Instruct-v0.2"
        
        self.tokenizer = AutoTokenizer.from_pretrained(model_name, trust_remote_code=True)
        self.model = AutoModelForCausalLM.from_pretrained(
            model_name,
            quantization_config=quantization_config,
            device_map="auto",
            torch_dtype=torch.float16,
            trust_remote_code=True
        )
        
        self.total_generations = 0
        self.successful_jsons = 0
        
        logger.info("✅ Mistral-7B załadowany i gotowy!")

    def generate_training_plan(self, prompt: str, max_retries: int = 2) -> str:
        """
        Generuje plan treningowy wspinaczkowy w formacie JSON.
        Automatycznie zatrzymuje generowanie gdy JSON jest kompletny.
        Próbuje ponownie jeśli JSON jest nieprawidłowy.
        """
        system_prompt = """You are an expert climbing coach AI that generates training plans.

CRITICAL: You must respond with ONLY a valid JSON object. No explanations, no markdown, no text before or after the JSON.

Your JSON must follow this exact structure:
{
  "name": "Training plan name",
  "workoutDays": [
    {
      "workoutDayOfWeek": 0-6,
      "sessions": [
        {
          "name": "Session name",
          "start": "HH:MM",
          "location": "Location",
          "exercises": [
            {
              "name": "Exercise name",
              "time": seconds,
              "breakTime": seconds,
              "setNumber": integer,
              "repNumber": integer
            }
          ]
        }
      ]
    }
  ]
}

STRICT RULES:
1. Return ONLY the JSON object - start with { and end with }
2. NO markdown code blocks (no ```)
3. NO text before or after the JSON
4. NO rest days - skip days that would be rest days
5. Every day must have at least one session with exercises
6. Include variety: finger strength, core work, flexibility, climbing sessions
7. Use realistic climbing exercises
8. All values must be numbers (not strings) for time, breakTime, setNumber, repNumber
9. workoutDayOfWeek must be 0-6 (Monday=0, Sunday=6)
10. COMPLETE the entire JSON - close all brackets

Start your response with { immediately."""
        
        for attempt in range(max_retries):
            if attempt > 0:
                logger.info(f"🔄 Próba {attempt + 1}/{max_retries}")
            
            input_text = f"{system_prompt}\n\nUser request: {prompt.strip()}\n\nJSON response:"
            inputs = self.tokenizer(input_text, return_tensors="pt").to(self.model.device)
            input_len = inputs["input_ids"].shape[1]
            
            logger.info(f"Długość promptu: {input_len} tokenów")
            
            stopping_criteria = StoppingCriteriaList([JSONStoppingCriteria(self.tokenizer)])
            
            import time
            start_time = time.time()
            
            with torch.no_grad():
                outputs = self.model.generate(
                    **inputs,
                    max_new_tokens=4000,  
                    temperature=0.7,
                    top_p=0.92,
                    do_sample=True,
                    pad_token_id=self.tokenizer.eos_token_id,
                    eos_token_id=self.tokenizer.eos_token_id,
                    stopping_criteria=stopping_criteria  
                )
            
            generation_time = time.time() - start_time
            
            response_ids = outputs[0][input_len:]
            response_text = self.tokenizer.decode(response_ids, skip_special_tokens=True)
            
            logger.info(f" Wygenerowano {len(response_ids)} tokenów w {generation_time:.2f}s")
            logger.info(f"   Prędkość: {len(response_ids)/generation_time:.1f} tokenów/s")
            logger.info(f"   Długość tekstu: {len(response_text)} znaków")
            
            # Walidacja
            cleaned_json, is_valid = extract_and_validate_json(response_text.strip())
            
            self.total_generations += 1
            
            if is_valid:
                self.successful_jsons += 1
                success_rate = (self.successful_jsons / self.total_generations) * 100
                logger.info(f"Wskaźnik sukcesu JSON: {success_rate:.1f}% ({self.successful_jsons}/{self.total_generations})")
                return cleaned_json
            else:
                logger.warning(f" Nieprawidłowy JSON w próbie {attempt + 1}")
                if attempt < max_retries - 1:
                    logger.info("Próbuję ponownie z wyższą temperaturą...")
        
        logger.error(" Nie udało się wygenerować poprawnego JSON po wszystkich próbach")
        return cleaned_json


_service_instance = None

def get_ai_service() -> AIService:
    global _service_instance
    if _service_instance is None:
        _service_instance = AIService()
    return _service_instance