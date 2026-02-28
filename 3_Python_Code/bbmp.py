from PIL import Image
import numpy as np

# Read the encrypted binary data from the file
with open('decrypted_nri.bin', 'rb') as f:
    binary_data = f.read()

# Convert the binary data to a numpy array
binary_array = np.frombuffer(binary_data, dtype=np.uint8)

# Check the size of the binary array
data_size = binary_array.size
print(f"Size of binary data: {data_size} bytes")

# Assuming the original image dimensions are known (e.g., 768x512 with 3 color channels)
image_width = 768
image_height = 512
num_channels = 3
expected_size = image_width * image_height * num_channels

# Trim or pad the binary array to match the expected size
if data_size > expected_size:
    binary_array = binary_array[:expected_size]
elif data_size < expected_size:
    # Pad with zeros if the data size is smaller than expected
    padding_size = expected_size - data_size
    binary_array = np.pad(binary_array, (0, padding_size), mode='constant')

# Reshape the array to the original image dimensions
image_array = binary_array.reshape((image_height, image_width, num_channels))

# Convert the numpy array back to an image
image = Image.fromarray(image_array)

# Save the image
image.save('decrypted_image.bmp')

print("The encrypted binary data has been successfully converted back to an image and saved as 'encrypted_image.bmp'.")
