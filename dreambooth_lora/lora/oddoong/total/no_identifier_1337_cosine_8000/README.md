---
tags:
- stable-diffusion
- stable-diffusion-diffusers
- diffusers-training
- text-to-image
- diffusers
- lora
- template:sd-lora
widget:

        - text: 'a white duck'
          output:
            url:
                "image_0.png"
        
        - text: 'a white duck'
          output:
            url:
                "image_1.png"
        
        - text: 'a white duck'
          output:
            url:
                "image_2.png"
        
        - text: 'a white duck'
          output:
            url:
                "image_3.png"
        
base_model: stable-diffusion-v1-5/stable-diffusion-v1-5
instance_prompt: a white duck
license: openrail++
---

# SD1.5 LoRA DreamBooth - no_identifier_1337_cosine_8000

<Gallery />

## Model description

### These are no_identifier_1337_cosine_8000 LoRA adaption weights for stable-diffusion-v1-5/stable-diffusion-v1-5.

## Download model

### Use it with UIs such as AUTOMATIC1111, Comfy UI, SD.Next, Invoke

- **LoRA**: download **[`/lora/oddoong/total/no_identifier_1337_cosine_8000.safetensors` here 💾](/no_identifier_1337_cosine_8000/blob/main//lora/oddoong/total/no_identifier_1337_cosine_8000.safetensors)**.
    - Place it on your `models/Lora` folder.
    - On AUTOMATIC1111, load the LoRA by adding `<lora:/lora/oddoong/total/no_identifier_1337_cosine_8000:1>` to your prompt. On ComfyUI just [load it as a regular LoRA](https://comfyanonymous.github.io/ComfyUI_examples/lora/).


## Use it with the [🧨 diffusers library](https://github.com/huggingface/diffusers)

```py
from diffusers import AutoPipelineForText2Image
import torch

pipeline = AutoPipelineForText2Image.from_pretrained('runwayml/stable-diffusion-v1-5', torch_dtype=torch.float16).to('cuda')
pipeline.load_lora_weights('no_identifier_1337_cosine_8000', weight_name='pytorch_lora_weights.safetensors')

image = pipeline('a white duck').images[0]
```

For more details, including weighting, merging and fusing LoRAs, check the [documentation on loading LoRAs in diffusers](https://huggingface.co/docs/diffusers/main/en/using-diffusers/loading_adapters)

## Trigger words

You should use a white duck to trigger the image generation.

## Details
All [Files & versions](/no_identifier_1337_cosine_8000/tree/main).

The weights were trained using [🧨 diffusers Advanced Dreambooth Training Script](https://github.com/huggingface/diffusers/blob/main/examples/advanced_diffusion_training/train_dreambooth_lora_sd15_advanced.py).

LoRA for the text encoder was enabled. False.

Pivotal tuning was enabled: False.

Special VAE used for training: None.

