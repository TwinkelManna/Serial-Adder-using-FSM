module tb_serial_adder;
	reg clk, reset,a,b;
	wire sum, cout;

	serial_adder F1(a, b,clk, sum, cout, reset);

	always begin
	#5 clk = ~clk;
	end

	initial
        begin
	$dumpfile("serial_adder.v");
	$dumpvars(0, tb_serial_adder);
	//$monitor("clk = %b , out =%b", clk, out);

	// Initialize Inputs
        clk = 1'b0;
        reset = 1'b1;
        //#2 reset = 1;  
        #15 reset = 1'b0;
	end

	initial begin
        //add two 4 bit numbers, 1111 + 1101 = 11101 
	#12 
        a = 0; b = 0;     #10;
        a = 1; b = 0;  #10;
        a = 1; b = 1; #10;
        a = 1; b = 0; #10;
        //add two 5 bit numbers, 11011 + 10001 = 101101
        a = 1; b = 1;    #10;
        a = 0; b = 0;   #10;
        a = 0; b = 1;   #10;
        a = 1; b = 0;   #10;
        a = 1; b = 1;   #10;
        $finish;
	end
endmodule
	
