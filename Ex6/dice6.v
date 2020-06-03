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
