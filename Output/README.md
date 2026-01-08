The output of the project demonstrates the successful encryption and decryption of image data using the RC6 algorithm implemented in Verilog HDL.

🔹 Encryption Output

The original input image is first converted into binary data using a Python script.

This binary data is processed by the RC6 encryption core in the FPGA simulation.

The output of the encryption stage is an encrypted binary file.

The encrypted data appears random and unintelligible, confirming that the image content is securely transformed and protected against unauthorized access.

Key Observation:

No visible patterns of the original image are preserved in the encrypted output.

This confirms strong diffusion and confusion properties of the RC6 algorithm.

🔹 Decryption Output

The encrypted binary data is provided as input to the RC6 decryption core.

After decryption, the output binary data is converted back into an image using Python.

The reconstructed image matches the original input image in resolution, color content, and structure.

Key Observation:

Successful recovery of the original image verifies:

Correct key expansion

Accurate round operations

Proper synchronization of encryption and decryption logic

🔹 Functional Verification Outcome

The encryption–decryption cycle preserves data integrity.

The decrypted image shows no pixel loss or distortion.

Simulation waveforms confirm correct assertion of control signals such as data valid and output enable.
