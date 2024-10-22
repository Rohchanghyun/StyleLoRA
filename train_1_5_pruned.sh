export TRANSFORMERS_OFFLINE=1
export HF_DATASETS_OFFLINE=1

accelerate launch train_dreambooth_b-lora_sd_1_5.py \
 --pretrained_model_name_or_path="../stable-diffusion-v1-5/" \
 --instance_data_dir="./data/paduk" \
 --output_dir="./output/content/paduk/48_constant_duck_2000" \
 --instance_prompt="A <v> duck" \
 --resolution=1024 \
 --rank=64 \
 --train_batch_size=1 \
 --learning_rate=5e-5 \
 --lr_scheduler="constant" \
 --lr_warmup_steps=0 \
 --max_train_steps=2000 \
 --checkpointing_steps=1000 \
 --seed="48" \
 --gradient_checkpointing \
 --use_8bit_adam \
 --mixed_precision="no"