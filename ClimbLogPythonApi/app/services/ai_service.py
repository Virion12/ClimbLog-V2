from transformers import AutoTokenizer, AutoModelForCausalLM, BitsAndBytesConfig, StoppingCriteria, StoppingCriteriaList
import torch
import logging

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
        
        logger.info("✅ Mistral-7B załadowany i gotowy!")

    def generate_training_plan(self, prompt: str) -> str:
        """
        Generuje plan treningowy wspinaczkowy w formacie JSON.
        Automatycznie zatrzymuje generowanie gdy JSON jest kompletny.
        """
        system_prompt = """
You are an expert climbing coach. 
Generate realistic and well-balanced climbing training plans with a variety of exercises in each session.
Time in exercises should be time of a single reptenition of exercise in seconds
Your response must be a single valid JSON object following this exact structure:
{
  "name": "Training plan name",
  "workoutDays": [
    {
      "workoutDayOfWeek": 0-6(not all days included you can chose, never generate workoutDays for rest days),
      "sessions": [
        {
          "name": "Session name",
          "start": "HH:MM",
          "location": "Location",
          "exercises": [
            {
              "name": "Exercise name",
              "time": time_in_seconds,
              "breakTime": rest_in_seconds,
              "setNumber": number_of_sets,
              "repNumber": number_of_repetitions
            }
          ]
        }
      ]
    }
  ]
}

Strict rules:
- Never leave structures like this (rest days):
          {
            "workoutDayOfWeek": 6,
            "sessions": [
              {
                "name": "Rest Day",
                "sessions": []
              }
            ]
          }
- Never generate workoutDay for rests days.
- Never generate exercise as rest.
- Skip workoutDayOfWeek for each resta day (do not generate it).
- Return ONLY valid JSON (no text, no markdown, no code fences, no explanations).
- Do not include comments or extra keys.
- Each workout day must contain at least one session with stretching or flexibility exercises.
- Every session should contain different exercises (variety is important).
- Use realistic climbing-related exercises (e.g., hangboard, bouldering, finger pull-ups, campus board, ARC training, stretching, mobility work).
- Each value must match its data type (e.g., integers for time and set counts).
- All text values must be in English.
- Do not include null or empty fields.
- DO NOT include any rest days, recovery days, or sessions named 'Rest Day'.
- If you think a rest day is needed, SKIP that day completely instead of generating it.
- Every generated day must contain at least one session with physical exercises.
- IMPORTANT: Complete the entire JSON structure. Close all brackets properly.

Return only pure JSON — nothing else.
"""
        
        input_text = f"{system_prompt}\nUżytkownik: {prompt.strip()}\nAI:"
        inputs = self.tokenizer(input_text, return_tensors="pt").to(self.model.device)
        input_len = inputs["input_ids"].shape[1]
        
        logger.info(f"Długość promptu: {input_len} tokenów")
        
        stopping_criteria = StoppingCriteriaList([JSONStoppingCriteria(self.tokenizer)])
        
        import time
        start_time = time.time()
        
        with torch.no_grad():
            outputs = self.model.generate(
                **inputs,
                max_new_tokens=2500,  
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
        
        return response_text.strip()


_service_instance = None

def get_ai_service() -> AIService:
    global _service_instance
    if _service_instance is None:
        _service_instance = AIService()
    return _service_instance