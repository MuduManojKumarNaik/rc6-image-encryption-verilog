from PIL import Image
import numpy as np

# Load the image
image = Image.open('nrilogo.jpg')

# Ensure the image is of size 768x512 and has 3 color channels (RGB)
image = image.resize((768, 512))
image = image.convert('RGB')

# Convert the image to a numpy array
image_array = np.array(image)

# Flatten the array to a 1D binary array
binary_array = image_array.flatten()

# Convert the binary array to bytes
binary_data = binary_array.tobytes()

# Save the binary data to a file
with open('image.bin', 'wb') as f:
    f.write(binary_data)

print("The image has been successfully converted to binary and saved as 'image_binary.bin'.")
