<<<<<<< HEAD
//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 
// Student Name:ISIDORA RADENKOVIC
// Date: June 2nd, 2020
//
//  Description: In this exercise, you need to design an electronic dice, following
//  the diagram provided in the exercises documentation. The dice rolls as long as
//  a button is pressed, and stops when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           throw [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////

=======
>>>>>>> 5669dc4b8c47ba8bbda1647239027c0972939be4
`timescale 1ns/100ps

module dice(
	input clk,
	input rst,
	input button,
	output reg [2:0] throw);

always @(posedge clk)
begin
if(rst)
	throw <= 3'b0;
else
	begin
	if(throw==3'b0 || throw==3'b111 || (throw==3'b110 && button))
		throw <= 3'b1;
	else 
		begin
		if(button)
		throw <= throw+1;
		end
	end
end

endmodule
