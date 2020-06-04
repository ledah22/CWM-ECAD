//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - Dice or Traffic Lights?
// Student Name:ISIDORA RADENKOVIC
// Date: June 3rd, 2020
//
// Description: A testbench module to test Ex6 - Dice or Traffic Lights?
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

module MuxDiceTraffic_tb();

//Parameters
parameter CLK_Period = 10;


//Registers and wires
reg err;
reg clk;
reg rst;
reg button;
reg sel;
reg [2:0] count;
reg [2:0] result_prev;
reg [2:0] result_now;

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
rst =0;
button =0;
sel = 0;
count =0;
#(2*CLK_Period)

forever begin

result_prev = result;
#(CLK_Period)
result_now = result;



if(sel)
		begin

		if(!((result_prev[2]&&!result_prev[1]&&!result_prev[0]&&result_now==3'b110)||(result_prev[2]&& result_prev[1]&&!result_prev[0]&&result_now== 3'b001)||(!result_prev[2]&&!result_prev[1]&&result_prev[0]&&result_now==3'b010)||(!result_prev[2]&&result_prev[1]&&!result_prev[0]&&result_now==3'b100)))
			begin
           		$display("***TEST FAILED! sel = %d, lights_before=%d-%d-%d but ligths_now = %d%d%d***",sel, result_prev[2], result_prev[1], result_prev[0], result_now[2], result_now[1], result_now[0]);
           err=1;
         		end
		end
else
	begin
if(rst)
	begin
	if(result_now!= 3'b0)
		begin
           	$display("***TEST FAILED! rst = %d and sel =%d, but result_now=%d***", rst, sel, result_now);
           	err=1;
         	end
	end
else
begin
	if((rst&&result_now !=3'b0)||(!rst && !button && !(((result_prev==3'b0||result_prev==3'b111)&& result_now==3'b0)||(result_now==result_prev))) || (!rst && button && !(((result_prev==3'b0||result_prev==3'b111||result_prev==3'b110)&& result_now==3'b0)||(result_now==result_prev+1))))
	begin
           $display("***TEST FAILED! sel= %d, rst=%d, button=%d, result_now=%d, result_prev = %d ***",sel, rst, button, result_now, result_prev);
           err=1;
         end
end

if(count == 3'b101)
		begin
		count =-1;
		rst = ~rst;
		end
	count = count+1;
	button = ~button;
	
end

sel = ~sel;

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
MuxDiceTraffic top(rst, clk, button, sel, result);
endmodule
