import os
from PIL import Image
import numpy as np

# 이미지 디렉토리 경로
image_dir = '/workspace/mnt/sda/changhyun/dataset/oddoong/total'

# 결과 저장 디렉토리
output_dir = '/workspace/mnt/sda/changhyun/dataset/oddoong/total_processed'
os.makedirs(output_dir, exist_ok=True)

# 디렉토리 내의 모든 이미지 파일 처리
for filename in os.listdir(image_dir):
    if filename.lower().endswith(('.png', '.jpg', '.jpeg')):
        # 이미지 열기
        img_path = os.path.join(image_dir, filename)
        img = Image.open(img_path)
        
        # 이미지를 NumPy 배열로 변환
        img_array = np.array(img)
        
        # 알파 채널이 있는 경우 처리
        if img_array.shape[-1] == 4:
            # 알파 채널이 0인 부분을 흰색으로 채우기
            white = np.array([255, 255, 255, 255], dtype=np.uint8)
            mask = img_array[:, :, 3] == 0
            img_array[mask] = white
        
        # RGB로 변환
        img_processed = Image.fromarray(img_array).convert('RGB')
        
        # 처리된 이미지 저장
        output_path = os.path.join(output_dir, filename)
        img_processed.save(output_path)

print(f"모든 이미지가 처리되어 {output_dir}에 저장되었습니다.")
