# 멀티 GPU 사용 시 충돌 방지(RTX 4090 에서 돌릴 떄에도 활성화)
export NCCL_P2P_DISABLE="1"
export NCCL_IB_DISABLE="1"

accelerate launch train_dreambooth_b-lora_sdxl.py \
 --pretrained_model_name_or_path="stabilityai/stable-diffusion-xl-base-1.0" \
 --instance_data_dir="./data/odoong/oddoong_sleep" \
 --output_dir="./output/content/oddoong/35_constant_sleep_duck_5000" \
 --instance_prompt="A <v> duck" \
 --resolution=1024 \
 --rank=64 \
 --train_batch_size=1 \
 --learning_rate=5e-5 \
 --lr_scheduler="constant" \
 --lr_warmup_steps=0 \
 --max_train_steps=5000 \
 --checkpointing_steps=1000 \
 --seed="35" \
 --gradient_checkpointing \
 --use_8bit_adam \
 --mixed_precision="no"
