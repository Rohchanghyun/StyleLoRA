accelerate launch train_dreambooth_b-lora_sdxl.py \
 --pretrained_model_name_or_path="stabilityai/stable-diffusion-xl-base-1.0" \
<<<<<<< HEAD
 --instance_data_dir="/workspace/mnt/sda/changhyun/dataset/images" \
  --resume_from_checkpoint "output/style/pokemon/35_constant_6000/checkpoint-6000" \
 --output_dir="./output/style/pokemon/35_constant_6000" \
 --instance_prompt="in <v1> style" \
=======
 --instance_data_dir="data/odoong/oddoong_sleep" \
 --output_dir="./output/style/oddoong/42_cosine_3000" \
 --instance_prompt="in <v> style" \
>>>>>>> 05695a84e7fdaf77c137cc9f6d42be3fc310350a
 --resolution=1024 \
 --rank=64 \
 --train_batch_size=1 \
 --learning_rate=5e-5 \
<<<<<<< HEAD
 --lr_scheduler="constant" \
 --lr_warmup_steps=0 \
 --max_train_steps=12000 \
 --checkpointing_steps=3000 \
 --seed="35" \
 --gradient_checkpointing \
 --use_8bit_adam \
 --mixed_precision="no"
=======
 --lr_scheduler="cosine" \
 --lr_warmup_steps=0 \
 --max_train_steps=3000 \
 --checkpointing_steps=1500 \
 --seed="42" \
 --gradient_checkpointing \
 --use_8bit_adam \
 --mixed_precision="fp16"
>>>>>>> 05695a84e7fdaf77c137cc9f6d42be3fc310350a
