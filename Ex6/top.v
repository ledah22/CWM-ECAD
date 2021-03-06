//////////////////////////////////////////////////////////////////////////////////
// Exercise #6 
// Student Name:ISIDORA RADENKOVIC
// Date: June 3rd, 2020
//
//
//  Description: In this exercise, you need to design a multiplexer between a dice and traffic 
//  lights, where the output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | dice
//   1  | traffic lights
//
//  inputs:
//           rst, clk, button,sel
//
//  outputs:
//           result[2:0]
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps
`include "dice6.v"
`include "traffic_lights6.v"

module MuxDiceTraffic(
input rst,
input clk,
input button,
input sel,
output wire [2:0] result
);

wire [2:0] tf;
wire [2:0] di;



traffic_lights traffic_lights6(clk, tf[2], tf[1], tf[0]);
dice dice6(clk, rst, button, di);
assign result = (sel)?(tf):(di);

endmodule


