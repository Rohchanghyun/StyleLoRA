export NCCL_P2P_DISABLE="1"
export NCCL_IB_DISABLE="1"

accelerate launch --mixed_precision="no"  train_text_to_image_lora.py\
  --pretrained_model_name_or_path="stable-diffusion-v1-5/stable-diffusion-v1-5" \
  --dataset_name="/workspace/mnt/sda/changhyun/dataset/oddoong/total_no_text" \
  --dataloader_num_workers=4 \
  --resolution=512 \
  --train_batch_size=1 \
  --gradient_accumulation_steps=4 \
  --max_train_steps=4000 \
  --learning_rate=1e-04 \
  --lr_scheduler="cosine" --lr_warmup_steps=0 \
  --output_dir="/workspace/mnt/sda/changhyun/dreambooth_lora/lora/oddoong/total_no_text/t2i/data_preprocess_identifier_1337_cosine_no_crop_4000" \
  --checkpointing_steps=1000 \
  --validation_prompt="a [v] duck" \
  --train_prompt="a [v] duck" \
  --validation_epochs=1000 \
  --seed=42


