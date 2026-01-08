rc6_core.v

Top-Level RC6 Encryption/Decryption Core

This module is the top-level wrapper of the RC6 image encryption system. It integrates the key expansion module and the data processing core, and controls the overall encryption or decryption flow based on the mode select signal. It provides a clean interface for input data, key loading, and output data with valid signaling, making it suitable for simulation and FPGA synthesis.

rc6_keyex.v

RC6 Key Expansion Module

This module implements the RC6 key scheduling algorithm. It expands a 128-bit secret key into multiple round keys required for the 20-round RC6 encryption and decryption process. The module uses rotation, modular addition, and mixing operations to generate secure round keys and indicates when key initialization is complete.

rc6_dpc.v

RC6 Data Processing Core (Encryption & Decryption Engine)

This module performs the core RC6 encryption and decryption operations. It processes 128-bit data blocks using four 32-bit registers and executes all 20 rounds of RC6 involving multiplication, rotation, XOR, and modular addition. The module is designed as a clocked, iterative architecture to ensure timing safety and efficient resource usage.

rc6_rol.v

Rotate-Left Logic Module

This module implements a parameterized rotate-left operation for 32-bit data words. It is used extensively in the RC6 algorithm for data-dependent rotations. The rotation amount is controlled dynamically, and the module is written in a fully synthesizable manner to support both encryption and decryption paths.
