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
reg [2:0] check;
reg [2:0] temp1;
reg [2:0] temp2;
//Clock
initial 
begin

clk = 1'b0;
	forever
	#(CLK_Period/2) clk = ~clk;

end

//Testing logic

//traffic_lights6 top4(clk, temp1[2], temp1[1], temp1[0]);
//dice6 top5(clk, rst, button, temp2);

initial begin

err =0;


forever begin

#(CLK_Period)

if (sel)
begin
if (check!=temp1)
err=1;
end
else
begin
if (check!=temp2)
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


//Instantiate
MuxDiceTraffic top(rst, clk, button, sel, check);
endmodule
