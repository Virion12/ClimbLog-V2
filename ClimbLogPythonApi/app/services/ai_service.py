from transformers import AutoTokenizer, AutoModelForCausalLM, BitsAndBytesConfig
import torch
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class AIService:
    def __init__(self):
        logger.info("Ładuję Mistral-7B-Instruct-v0.2...")

        # --- konfiguracja 4-bitowa (oszczędność VRAM) ---
        quantization_config = BitsAndBytesConfig(
            load_in_4bit=True,
            bnb_4bit_compute_dtype=torch.float16,
            bnb_4bit_use_double_quant=True,
            bnb_4bit_quant_type="nf4"
        )

        # --- nazwa modelu na Hugging Face ---
        model_name = "mistralai/Mistral-7B-Instruct-v0.2"

        # --- tokenizer i model ---
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
        Generuje plan treningowy wspinaczkowy w formacie JSON (bez walidacji).
        """
        system_prompt = """
          You are an expert climbing coach. 
          Generate realistic and well-balanced climbing training plans with a variety of exercises in each session.

          Your response must be a single valid JSON object following this exact structure:

          {
            "name": "Training plan name",
            "workoutDays": [
              {
                "workoutDayOfWeek": 1-7,
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
          - Return ONLY valid JSON (no text, no markdown, no code fences, no explanations).
          - Do not include comments or extra keys.
          - Each workout day must contain at least one session with stretching or flexibility exercises.
          - Every session should contain different exercises (variety is important).
          - Use realistic climbing-related exercises (e.g., hangboard, bouldering, finger pull-ups, campus board, ARC training, stretching, mobility work).
          - Each value must match its data type (e.g., integers for time and set counts).
          - All text values must be in English.
          - Do not include null or empty fields.

          Return only pure JSON — nothing else.
          """



        input_text = f"{system_prompt}\nUżytkownik: {prompt.strip()}\nAI:"

        inputs = self.tokenizer(input_text, return_tensors="pt").to(self.model.device)
        input_len = inputs["input_ids"].shape[1]

        with torch.no_grad():
            outputs = self.model.generate(
                **inputs,
                max_new_tokens=1500,
                temperature=0.6,
                top_p=0.9,
                do_sample=True,
                pad_token_id=self.tokenizer.eos_token_id
            )

        response_ids = outputs[0][input_len:]
        response_text = self.tokenizer.decode(response_ids, skip_special_tokens=True)
        return response_text.strip()


# --- singleton do ponownego użycia w FastAPI ---
_service_instance = None

def get_ai_service() -> AIService:
    global _service_instance
    if _service_instance is None:
        _service_instance = AIService()
    return _service_instance
