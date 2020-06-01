//////////////////////////////////////////////////////////////////////////////////
// Exercise #3 
// Student Name:ISIDORA RADENKOVIC
// Date: June 1st, 2020
//
//  Description: In this exercise, you need to design an up / down counter, where 
//  if the rst=1, the counter should be set to zero. If enable=0, the value
//  should stay constant. If direction=1, the counter should count up every
//  clock cycle, otherwise it should count down.
//  Wrap-around values are allowed.
//
//  inputs:
//           clk, rst, enable, direction
//
//  outputs:
//           counter_out[7:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

module counter(
    //Todo: add ports 
	input clk,
	input rst,
	input enable,
	input direction,
	output reg [7:0] counter_out
    );
                    
    //Todo: add registers and wires, if needed
	//reg [7:0] counter_out;

    //Todo: add user logic

always @(clk) begin
//assign counter_out = (rst||counter_out==8'b11111111)?(8'b0):((enable)?((direction)?(counter_out +1):(counter_out //1)):counter_out);

if (rst) begin 
counter_out <= 8'b0;
end
else
begin
if (enable)
begin
if (direction)
begin
if (counter_out==8'b11111111)
counter_out <= 8'b0;
else
counter_out <= counter_out +1;
end
else
begin
if (counter_out==8'b0)
counter_out <= 8'b11111111;
else
counter_out <= counter_out -1;
end

end
end
end

endmodule
