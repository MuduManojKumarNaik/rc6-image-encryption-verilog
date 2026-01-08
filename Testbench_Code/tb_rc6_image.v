`timescale 1ns/1ps
module tb_rc6_image;
    reg i_clk, i_rst;
    reg i_flag;  // 1 for encryption
    reg [127:0] i_key;
    reg i_key_en;
    wire o_key_ok;
    reg [127:0] i_din;
    reg i_din_en;
    wire [127:0] o_dout;
    wire o_dout_en;

    integer file_in, file_out, i;
    reg [7:0] data_in [0:15]; // 128 bits = 16 bytes
    reg [7:0] data_out [0:15];

    // Instantiate the RC6 encryption module
    rc6_core uut (
        .i_clk(i_clk),
        .i_rst(i_rst),
        .i_flag(i_flag),
        .i_key(i_key),
        .i_key_en(i_key_en),
        .o_key_ok(o_key_ok),
        .i_din(i_din),
        .i_din_en(i_din_en),
        .o_dout(o_dout),
        .o_dout_en(o_dout_en)
    );

    // Clock generation
    always #5 i_clk = ~i_clk;

    initial begin
        // Initialize signals
        i_clk = 0;
        i_rst = 1;
        i_flag = 1;  // Encryption mode
        i_key = 128'h000102030405060708090A0B0C0D0E0F; // Example key
        i_key_en = 1;
        i_din_en = 1;

        // Open files
        file_in = $fopen("nrirc.bin", "rb");
        if (file_in == 0) begin
            $display("Error: Could not open input file.");
            $finish;
        end

        file_out = $fopen("encrypted_nri.bin", "wb");
        if (file_out == 0) begin
            $display("Error: Could not open output file.");
            $finish;
        end

        // Wait for key initialization
        #10 i_rst = 0;
        #10 i_key_en = 0;

        // Encrypt each 128-bit block
        while (!$feof(file_in)) begin
            // Read 16 bytes (128 bits) from the file
            for (i = 0; i < 16; i = i + 1)
                data_in[i] = $fgetc(file_in);

            // Convert bytes to 128-bit data
            i_din = {data_in[0], data_in[1], data_in[2], data_in[3],
                     data_in[4], data_in[5], data_in[6], data_in[7],
                     data_in[8], data_in[9], data_in[10], data_in[11],
                     data_in[12], data_in[13], data_in[14], data_in[15]};

            i_din_en = 1;
            #10 i_din_en = 0; // Wait for encryption

            // Wait until data is ready
            wait (o_dout_en);

            // Split the output into bytes
            {data_out[0], data_out[1], data_out[2], data_out[3],
             data_out[4], data_out[5], data_out[6], data_out[7],
             data_out[8], data_out[9], data_out[10], data_out[11],
             data_out[12], data_out[13], data_out[14], data_out[15]} = o_dout;

            // Write encrypted data to file
            for (i = 0; i < 16; i = i + 1)
                $fwrite(file_out, "%c", data_out[i]);
        end

        // Close files
        $fclose(file_in);
        $fclose(file_out);
        $display("Encryption complete. Encrypted image saved to 'encrypted_image.bin'.");
        $finish;
    end
endmodule


