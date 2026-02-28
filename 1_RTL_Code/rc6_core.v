module rc6_core(
    input           i_clk,
    input           i_rst,
    input           i_flag,    //1-encrypt,0-decrypt
    input  [127:0]  i_key,
    input           i_key_en,  //1-key init start
	output 			o_key_ok,  //1-key init done
    input  [127:0]   i_din,
    input           i_din_en,
    output [127:0]   o_dout,
    output          o_dout_en
    );
 
	wire  [32*44-1:0] s_exkey;
 
	//key expand
	rc6_keyex u_keyex(
	.i_clk		(i_clk		),
	.i_rst		(i_rst		),
	.i_key		(i_key		),
	.i_key_en	(i_key_en	),
	.o_exkey	(s_exkey	),
	.o_key_ok	(o_key_ok	)	
	);

	// data encrypt or decrypt
	rc6_dpc u_dpc(
	.i_clk		(i_clk		),
	.i_rst		(i_rst		),	
	.i_flag		(i_flag		),
	.i_keyex	(s_exkey	),
    .i_din		(i_din		),
    .i_din_en	(i_din_en	),
    .o_dout		(o_dout		),
    .o_dout_en	(o_dout_en	)
	);	
	
endmodule

