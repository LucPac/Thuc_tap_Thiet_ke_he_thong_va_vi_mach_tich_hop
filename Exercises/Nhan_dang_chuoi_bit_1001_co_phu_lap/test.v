module test;

	// Inputs
	reg clk;
	reg reset;
	reg Sin;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	Moore uut (
		.clk(clk), 
		.reset(reset), 
		.Sin(Sin), 
		.out(out)
	);

	 // Clock generation (period = 10ns)
    always #10 clk = ~clk;

    // Test sequence
    initial begin
    clk = 0;
    reset = 1;
    Sin = 0;  // Kh?i t?o Sin
    #10 reset = 0;

        # 21 Sin = 0; 
		  # 21 Sin = 1; 
		  # 21 Sin = 0; 
		  # 21 Sin = 0; 
		  # 21 Sin = 1; 
		  # 21 Sin = 0; 
		  # 21 Sin = 0; 
		  # 21 Sin = 1; 
		  # 21 Sin = 1; 
		  # 21 Sin = 1;
		  # 21 Sin = 1; 
		  # 21 Sin = 0; 
		  # 21 Sin = 0; 
		  # 21 Sin = 1; 
		  
		  // Finish simulation
        //#21 $finish;
    end

    // Monitor signals (optional, for debugging)
    initial begin
        $monitor("Time=%0t | clk=%b | reset=%b | Sin=%b | out=%b | current_state=%b", 
                 $time, clk, reset, Sin, out, uut.current_state);
    end

endmodule
