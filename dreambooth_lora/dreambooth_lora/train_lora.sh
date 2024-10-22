export NCCL_P2P_DISABLE="1"
export NCCL_IB_DISABLE="1"

accelerate launch --mixed_precision="no"  train_dreambooth_lora_sd15_advanced.py\
  --pretrained_model_name_or_path="stable-diffusion-v1-5/stable-diffusion-v1-5" \
  --instance_data_dir="/workspace/mnt/sda/changhyun/dataset/oddoong/single" \
  --dataloader_num_workers=4 \
  --resolution=512 \
  --train_batch_size=1 \
  --gradient_accumulation_steps=4 \
  --max_train_steps=2000 \
  --instance_prompt="a [v] duck" \
  --learning_rate=1e-04 \
  --lr_scheduler="cosine" --lr_warmup_steps=0 \
  --output_dir="/workspace/mnt/sda/changhyun/dreambooth_lora/lora/oddoong/single/data_preprocess_no_identifier_1337_cosine_no_dora_variant_2000" \
  --checkpointing_steps=1000 \
  --validation_prompt="a [v] duck" \
  --validation_epochs=1000 \
  --seed=42


# accelerate launch --mixed_precision="no"  train_dreambooth_lora_sd15_advanced.py\
#   --pretrained_model_name_or_path="stable-diffusion-v1-5/stable-diffusion-v1-5" \
#   --instance_data_dir="/workspace/mnt/sda/changhyun/dataset/oddoong/total" \
#   --dataloader_num_workers=4 \
#   --resolution=512 \
#   --train_batch_size=1 \
#   --gradient_accumulation_steps=4 \
#   --max_train_steps=2000 \
#   --instance_prompt="a [v] duck" \
#   --learning_rate=1e-04 \
#   --lr_scheduler="cosine" --lr_warmup_steps=0 \
#   --output_dir="/workspace/mnt/sda/changhyun/dreambooth_lora/lora/oddoong/total/data_preprocess_no_identifier_1337_cosine_no_dora_variant_2000" \
#   --checkpointing_steps=1000 \
#   --validation_prompt="a [v] duck" \
#   --validation_epochs=1000 \
#   --seed=42