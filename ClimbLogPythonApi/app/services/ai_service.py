from transformers import AutoTokenizer, AutoModelForCausalLM, BitsAndBytesConfig
import torch
import logging
from typing import Optional

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class AIService:
    def __init__(self):
        logger.info("🔄 Ładuję DeepSeek 7B...")
        
        # Konfiguracja 4-bit (oszczędza VRAM - ~4GB zamiast ~14GB)
        quantization_config = BitsAndBytesConfig(
            load_in_4bit=True,
            bnb_4bit_compute_dtype=torch.float16,
            bnb_4bit_use_double_quant=True,
            bnb_4bit_quant_type="nf4"
        )
        
        model_name = "deepseek-ai/deepseek-coder-6.7b-instruct"
        
        self.tokenizer = AutoTokenizer.from_pretrained(
            model_name,
            trust_remote_code=True
        )
        
        self.model = AutoModelForCausalLM.from_pretrained(
            model_name,
            quantization_config=quantization_config,
            device_map="auto",
            trust_remote_code=True,
            torch_dtype=torch.float16
        )
        
        logger.info("✅ DeepSeek gotowy!")
        if torch.cuda.is_available():
            memory = torch.cuda.memory_allocated(0) / 1024**3
            logger.info(f"📊 VRAM użyta: {memory:.2f} GB")
        
    def generate_training_plan(self, prompt: str) -> str:
        """Generuje plan treningowy"""
        
        system_prompt = """Jesteś ekspertem od planowania treningów fitness i siłowych.
Tworzysz spersonalizowane, bezpieczne plany treningowe.

ZAWSZE uwzględniaj:
- Poziom zaawansowania
- Dostępny sprzęt
- Ograniczenia zdrowotne
- Cele treningowe
- Dostępny czas

STRUKTURA:
1. Analiza potrzeb (krótko)
2. Plan treningowy (dni + ćwiczenia)
3. Wskazówki regeneracji
4. Bezpieczeństwo

Odpowiadaj PO POLSKU, konkretnie."""

        messages = [
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": prompt}
        ]
        
        try:
            logger.info("🤖 Generuję plan...")
            
            # Przygotuj prompt
            text = self.tokenizer.apply_chat_template(
                messages,
                tokenize=False,
                add_generation_prompt=True
            )
            
            inputs = self.tokenizer(text, return_tensors="pt").to(self.model.device)
            input_length = inputs['input_ids'].shape[1]
            
            # Generuj
            with torch.no_grad():
                outputs = self.model.generate(
                    **inputs,
                    max_new_tokens=1000,
                    temperature=0.7,
                    top_p=0.9,
                    do_sample=True,
                    pad_token_id=self.tokenizer.pad_token_id,
                    eos_token_id=self.tokenizer.eos_token_id
                )
            
            # Dekoduj TYLKO nową część (bez promptu)
            generated_ids = outputs[0][input_length:]
            response = self.tokenizer.decode(generated_ids, skip_special_tokens=True)
            
            # Cleanup - usuń ewentualne znaczniki
            response = response.replace("<|im_end|>", "").replace("<|endoftext|>", "").strip()
            
            # Jeśli nadal jest śmietnik, spróbuj wyciągnąć tylko część po "Response:"
            if "### Response:" in response:
                response = response.split("### Response:")[-1].strip()
            
            logger.info("✅ Plan gotowy!")
            return response
            
        except Exception as e:
            logger.error(f"❌ Błąd: {str(e)}")
            raise Exception(f"Błąd generowania: {str(e)}")

# Singleton
_service_instance: Optional[AIService] = None

def get_ai_service() -> AIService:
    global _service_instance
    if _service_instance is None:
        _service_instance = AIService()
    return _service_instance