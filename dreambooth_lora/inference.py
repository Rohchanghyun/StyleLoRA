import torch
from diffusers import StableDiffusionPipeline, DPMSolverMultistepScheduler
from safetensors.torch import load_file
import os

# LoRA 가중치 경로
lora_path = "/workspace/mnt/sda/changhyun/dreambooth_lora/lora/oddoong/single/data_preprocess_no_identifier_1337_cosine_no_crop_2000/checkpoint-1000/pytorch_lora_weights.safetensors"

# 파일 존재 여부 확인
if not os.path.exists(lora_path):
    raise FileNotFoundError(f"LoRA 가중치 파일을 찾을 수 없습니다: {lora_path}")

# 기본 모델 로드
model_id = "stable-diffusion-v1-5/stable-diffusion-v1-5"
pipe = StableDiffusionPipeline.from_pretrained(model_id, torch_dtype=torch.float16)
pipe.scheduler = DPMSolverMultistepScheduler.from_config(pipe.scheduler.config)

# NSFW 필터 비활성화
pipe.safety_checker = None

# # LoRA 가중치 로드
# try:
#     state_dict = load_file(lora_path)
#     pipe.unet.load_attn_procs(state_dict)
# except OSError as e:
#     print(f"LoRA 가중치 로드 중 오류 발생: {e}")
#     print("LoRA 가중치 없이 계속 진행합니다.")

# GPU로 이동
pipe = pipe.to("cuda")

# 프롬프트 설정
prompt = "a white duck"

# 이미지 저장 경로 설정
output_dir = "/workspace/mnt/sda/changhyun/dreambooth_lora/output/sdv1-5"
os.makedirs(output_dir, exist_ok=True)

# 이미지 생성 (512x512 크기로 설정)
images = pipe(prompt, num_inference_steps=30, guidance_scale=7.5, num_images_per_prompt=5, height=512, width=512).images

# 이미지 저장
for i, image in enumerate(images):
    image.save(os.path.join(output_dir, f"generated_image_{i+1}.png"))

print(f"5장의 512x512 크기의 이미지가 생성되어 '{output_dir}' 디렉토리에 'generated_image_1.png'부터 'generated_image_5.png'까지 저장되었습니다.")
