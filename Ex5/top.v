//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 
// Student Name:ISIDORA RADENKOVIC
// Date: June 2nd, 2020
//
//  Description: In this exercise, you need to implement a UK traffic lights 
//  sequencing system. 
//
//  inputs:
//           clk
//
//  outputs:
//           red, amber, green
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

module traffic_lights(
	input clk,
	output red,
	output amber,
	output green
	
	);

//This counter is connected to the lights in the following order:
// red, red+amber, green, amber -->  00, 01, 10, 11
	reg [1:0]lights;


assign red = (lights[1])?(1'b0):(1'b1);
assign amber = (lights[0])?(1'b1):(1'b0);
assign green = (lights == 2'b10)? (1'b1):(1'b0);


always @(posedge clk)
begin

if (lights==2'b11)
lights <= 2'b0;
else 
lights <= lights+1;

/*
if (lights==2'b0)
	begin
	red <= 1;
	amber <= 0;
	green <= 0;
	end
else 
begin
	if (lights==2'b01)
		begin
		red <= 1;
		amber <= 1;
		green <= 0;
		end
	else 
	begin
		if(lights==2'b10)
			begin
			red <= 0;
			amber <= 0;
			green <= 1;
			end
		else
		begin
			if(lights==2'b11)
			red <= 0;
			amber <= 1;
			green <= 0;
		end
	end
end
*/
end

endmodule
