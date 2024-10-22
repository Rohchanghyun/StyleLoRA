import os
from PIL import Image
import numpy as np

# def check_images(directory):
#     for filename in os.listdir(directory):
#         if filename.endswith(('.png', '.jpg', '.jpeg')):
#             file_path = os.path.join(directory, filename)
#             try:
#                 img = Image.open(file_path)
#                 img.verify()
#             except (IOError, SyntaxError) as e:
#                 print(f'손상된 이미지: {file_path}')

# def save_pixel_values(image_path, output_dir):
#     try:
#         img = Image.open(image_path)
#         img_array = np.array(img)
        
#         # 이미지 파일 이름에서 확장자 제거
#         base_filename = os.path.splitext(os.path.basename(image_path))[0]
        
#         # 픽셀 값을 저장할 텍스트 파일 경로
#         output_path = os.path.join(output_dir, f"{base_filename}_pixel_values.txt")
        
#         # 이미지가 컬러인 경우 (3D 배열)
#         if len(img_array.shape) == 3:
#             # RGB 채널별로 저장
#             with open(output_path, 'w') as f:
#                 for i, channel in enumerate(['R', 'G', 'B']):
#                     f.write(f"{channel} 채널:\n")
#                     np.savetxt(f, img_array[:,:,i], fmt='%d')
#                     f.write("\n")
#         else:
#             # 그레이스케일 이미지인 경우 (2D 배열)
#             np.savetxt(output_path, img_array, fmt='%d')
        
#         print(f'픽셀 값이 저장되었습니다: {output_path}')
#     except Exception as e:
#         print(f'이미지 처리 중 오류 발생: {e}')

# # 이미지가 있는 디렉토리 경로
# image_directory = '/workspace//mnt/sda/changhyun/dreambooth_lora/output/oddoong/single/data_preprocess_no_identifier_1337_cosine_no_crop_1000'

# # 픽셀 값을 저장할 디렉토리 경로
# output_directory = '/workspace//mnt/sda/changhyun/dreambooth_lora/output/pixel_values'

# # 출력 디렉토리가 없으면 생성
# os.makedirs(output_directory, exist_ok=True)

# check_images(image_directory)

# # 첫 번째 이미지의 픽셀 값만 텍스트 파일로 저장
# for filename in os.listdir(image_directory):
#     if filename.endswith(('.png', '.jpg', '.jpeg')):
#         image_path = os.path.join(image_directory, filename)
#         save_pixel_values(image_path, output_directory)
#         break  # 첫 번째 이미지만 처리하고 루프 종료

image_directory = '/workspace/mnt/sda/changhyun/dreambooth_lora/output/oddoong/single/data_preprocess_no_identifier_1337_cosine_no_crop_1000'

# 이미지 크기 출력 함수
def print_image_size(image_path):
    try:
        with Image.open(image_path) as img:
            width, height = img.size
            print(f'이미지 크기: {width}x{height} 픽셀')
    except Exception as e:
        print(f'이미지 크기 확인 중 오류 발생: {e}')

# 이미지 디렉토리 내의 모든 이미지 크기 출력
for filename in os.listdir(image_directory):
    if filename.endswith(('.png', '.jpg', '.jpeg')):
        image_path = os.path.join(image_directory, filename)
        print(f'파일명: {filename}')
        print_image_size(image_path)
        print()  # 각 이미지 정보 사이에 빈 줄 추가
