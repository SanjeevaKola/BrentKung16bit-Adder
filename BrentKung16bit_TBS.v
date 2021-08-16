`timescale 1ns / 1ps

module BrentKung16bit_TBS;

	// Inputs
	reg [15:0] X;
	reg [15:0] Y;
	reg Cin;

	// Outputs
	wire Cout;
	wire [15:0] SUM;

	// Instantiate the Unit Under Test (UUT)
	BrentKung16bit dut (
		.a(X), 
		.b(Y), 
		.Cin(Cin), 
		.Sum(SUM),
		.Cout(Cout) 
	);

	initial begin
		// Initialize Inputs
		X = 0;
		Y = 0;
		Cin = 0;

		#10;
        X=22;
		  Y=53;
		  Cin=0;
		  #10
		   X=35;
		  Y=42;
		  Cin=1;
		  
		  		  #10
		   X=243;
		  Y=37;
		  Cin=0;
		  
		  		  #10
		   X=645;
		  Y=246;
		  Cin=0;

		  #10
		   X=7;
		  Y=6;
		  Cin=1;

	end
      
endmodule

