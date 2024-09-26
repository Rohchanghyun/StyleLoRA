#export TRANSFORMERS_OFFLINE=1
#export HF_DATASETS_OFFLINE=1

CUDA_VISIBLE_DEVICES=0 python inference.py --prompt="A <v> duck in <v32> style" --content_B_LoRA="./output/content/oddoong/48_constant_duck_3000/checkpoint-3000/" --style_B_LoRA="lora-library/B-LoRA-ink_sketch" --output_path="output/content/oddoong/48_constant_duck_3000/ink" --num_images_per_prompt=10
CUDA_VISIBLE_DEVICES=0 python inference.py --prompt="A <v> duck in <v32> style" --content_B_LoRA="./output/content/oddoong/48_constant_duck_4000/checkpoint-4000/" --style_B_LoRA="lora-library/B-LoRA-ink_sketch" --output_path="output/content/oddoong/48_constant_duck_4000/ink" --num_images_per_prompt=10
CUDA_VISIBLE_DEVICES=0 python inference.py --prompt="A <v> duck in <v32> style" --content_B_LoRA="./output/content/oddoong/48_constant_duck_5000/checkpoint-5000/" --style_B_LoRA="lora-library/B-LoRA-ink_sketch" --output_path="output/content/oddoong/48_constant_duck_5000/ink" --num_images_per_prompt=10