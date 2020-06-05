//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Times Table
// Student Name:ISIDORA RADENKOVIC
// Date: June 5th, 2020
//
// Description: A testbench module to test Ex7 - Times Table
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

module multiply_tb();
//Parameters
parameter CLK_Period = 10;


//Registers and wires
reg err;
reg clk;
reg enable;
reg [2:0] a;
reg [2:0] b;
wire [4:0] result;
reg [4:0] result_prev;

//Clock
initial 
begin

clk = 1'b0;
	forever
	#(CLK_Period/2) clk = ~clk;

end

//Testing logic

initial begin
err=0;
enable=0;

forever begin
result_prev = result;
#(CLK_Period)

	if(enable)
		begin
		if (result!=a*b)
		begin
			$display("Test FAILED! enable =%d, a=%d, b=%d, result=%d", enable, a, b, result);
			err=1;
		end
		end
	else
		begin
		
		if(result_prev!=result)
		begin
			$display("Test FAILED! enable =%d, a=%d, b=%d, result=%d", enable, a, b, result);
			err=1;
		end
		end

enable = ~enable;
end
end
//Success check

initial begin
        #100
        if (err==0)begin
          $display("***TEST PASSED! :) ***");
        $finish;
 end
else 	begin $display("***Test failed... :(( ***");
        $finish;
	end
      end


//Instantiate
multiply top(clk, a, b, enable, result);
endmodule

