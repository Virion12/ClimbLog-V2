from transformers import AutoTokenizer, AutoModelForCausalLM, BitsAndBytesConfig
import torch
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class AIService:
    def __init__(self):
        logger.info("Ładuję DeepSeek 7B...")

        quantization_config = BitsAndBytesConfig(
            load_in_4bit=True,
            bnb_4bit_compute_dtype=torch.float16,
            bnb_4bit_use_double_quant=True,
            bnb_4bit_quant_type="nf4"
        )

        model_name = "deepseek-ai/deepseek-coder-6.7b-instruct"

        self.tokenizer = AutoTokenizer.from_pretrained(model_name, trust_remote_code=True)
        self.model = AutoModelForCausalLM.from_pretrained(
            model_name,
            quantization_config=quantization_config,
            device_map="auto",
            trust_remote_code=True,
            torch_dtype=torch.float16
        )

        logger.info(" DeepSeek gotowy!")

    def generate_training_plan(self, prompt: str) -> str:
        """
        Generuje odpowiedź AI w formacie JSON (jako string), bez żadnej ingerencji.
        """
        system_prompt = """Jesteś ekspertem od treningów wspinaczkowych.
ZWRÓĆ TYLKO POPRAWNY JSON w formacie planu treningowego:
{
  "name": "Nazwa planu",
  "workoutDays": [
    {
      "workoutDayOfWeek": 1-7,
      "sessions": [
        {
          "name": "Nazwa sesji",
          "start": "HH:MM",
          "location": "Lokalizacja",
          "exercises": [
            {
              "name": "Nazwa ćwiczenia",
              "time": czas_w_sekundach,
              "breakTime": przerwa_w_sekundach,
              "setNumber": liczba_serii,
              "repNumber": liczba_powtórzeń
            }
          ]
        }
      ]
    }
  ]
}


MASZ ZWROCIC SAM JSON NIC POZA TYM 
NIe PODAWAJ ŻADNEJ IMPLEMENTACJI W KTÓRYMKOLWIEK JĘZYKU ANI NIC PODOBNEGO 
NIE DODAWAJ ŻADNEGO TEKSTU POZA JSON!"""

        # Przygotowanie promptu
        input_text = f"{system_prompt}\nUżytkownik: {prompt.strip()}"

        inputs = self.tokenizer(input_text, return_tensors="pt").to(self.model.device)
        input_len = inputs['input_ids'].shape[1]

        with torch.no_grad():
            outputs = self.model.generate(
                **inputs,
                max_new_tokens=3000,
                temperature=0.6,
                top_p=0.9,
                do_sample=True,
                pad_token_id=self.tokenizer.eos_token_id
            )

        response_ids = outputs[0][input_len:]
        response_text = self.tokenizer.decode(response_ids, skip_special_tokens=True)
        return response_text.strip()


_service_instance = None

def get_ai_service() -> AIService:
    global _service_instance
    if _service_instance is None:
        _service_instance = AIService()
    return _service_instance
