import os
from rembg import remove
from PIL import Image

input_folder = '.'  # Change this to your actual folder path
supported_formats = ('.jpg', '.jpeg', '.png', '.bmp')

counter = 1

for filename in os.listdir(input_folder):
    if filename.lower().endswith(supported_formats):
        input_path = os.path.join(input_folder, filename)

        with open(input_path, 'rb') as inp_file:
            input_data = inp_file.read()
            output_data = remove(input_data)

        output_path = os.path.join(input_folder, os.path.splitext(filename)[0] + '.png')
        with open(output_path, 'wb') as out_file:
            out_file.write(output_data)

        if not filename.lower().endswith('.png'):
            os.remove(input_path)

        print(f"{counter} done: {filename}")
        counter += 1

print("✅ All images processed.")
