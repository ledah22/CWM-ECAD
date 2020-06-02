//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name:ISIDORA RADENKOVIC
// Date: June 1st, 2020
//
// Description: A testbench module to test Ex3 - counter
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
	parameter CLK_PERIOD = 10;

//Todo: Regitsers and wires
	reg [7:0] counter_out;
	reg [7:0] counter_out_prev;
	reg err;
	reg clk;
	reg rst;
	reg enable;
	reg direction;

//Todo: Clock generation

initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
     end

//Todo: User logic

initial begin

rst = 0;
enable = 1;
direction = 1;
err=0;
counter_out_prev = 8'b0;
counter_out = 8'b1;

forever begin
counter_out_prev = counter_out;
if(direction)
	begin
	direction = 0;
		if (enable)
		begin
		rst =1;
		end
	enable = ~enable;
	end
else
	begin
	direction =1;
	end

#(CLK_PERIOD)

if((rst &&counter_out!=0)||(rst==0&&enable==0&& counter_out!=counter_out_prev)||(rst==0&&enable==1&&direction==1&& !(counter_out==counter_out_prev+1 || (counter_out==0 && counter_out_prev== 8'b11111111))) || (rst==0&&enable==1&&direction==0&& !(counter_out==counter_out_prev-1 || (counter_out==8'b11111111 && counter_out_prev== 0))))
begin
           $display("***TEST FAILED! rst=%d, enable=%d, direction= %d, counter_out=%d, counter_out_prev = %d ***",rst, enable, direction, counter_out, counter_out_prev);
           err=1;
         end


end
end
//Todo: Finish test, check for success
initial begin
        #50 
        if (err==0)begin
          $display("***TEST PASSED! :) ***");
        $finish;
 end
else 	begin $display("***Test failed... :(( ***");
        $finish;
	end
      end
//Todo: Instantiate counter module
 counter top();
endmodule 
