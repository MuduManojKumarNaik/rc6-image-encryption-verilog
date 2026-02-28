tb_rc6_image.v
RC6 Image Encryption Testbench

This testbench verifies the RC6 encryption functionality by reading binary image data from a file and applying it as 128-bit input blocks to the RC6 core. It initializes the encryption key, controls clock and reset signals, and monitors the encrypted output data. The testbench writes the encrypted output to a binary file, enabling end-to-end validation of the encryption process through software-based image reconstruction.

tb_image_decryption.v
RC6 Image Decryption Testbench

This testbench validates the RC6 decryption operation by supplying encrypted binary data to the RC6 core in decryption mode. It manages key initialization, clocking, and control signaling, and captures the decrypted output data into a binary file. The correctness of decryption is confirmed by converting the output binary data back into an image and comparing it with the original input image.
