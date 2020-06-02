//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name:ISIDORA RADENKOVIC
// Date: June 2nd, 2020
//
// Description: A testbench module to test Ex4 - Electronic Dice
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

module dice_tb();

//Parameters
parameter CLK_Period = 10;


//Registers and wires
reg err;
reg clk;
reg rst;
reg button;
reg [2:0] throw_prev;
reg count;

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
rst=1;
button = 0;
count=0;

forever begin

throw_prev = throw;
if(count == 10)
	begin
	count =-1;
	rst = ~rst;
	end
count = count+1;
button = ~button;

#(CLK_Period)

if((rst&&throw!=3'b0)||(!rst && !button && !(((throw_prev==3'b0||throw_prev==3'b111)&& throw==3'b0)||(throw==throw_prev))) || (!rst && button && !(((throw_prev==3'b0||throw_prev==3'b111||throw_prev==3'b110)&& throw==3'b0)||(throw==throw_prev+1))))
begin
           $display("***TEST FAILED! rst=%d, button=%d, throw=%d, throw_prev = %d ***",rst, button, throw, throw_prev);
           err=1;
         end
end
end

//Success check

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
//Instantiate counter module
dice top(.clk (clk), .rst (rst), .button (button), .throw (throw));
endmodule
