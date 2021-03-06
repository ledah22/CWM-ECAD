//////////////////////////////////////////////////////////////////////////////////
// Exercise #7
// Student Name:ISIDORA RADENKOVIC
// Date: June 5th, 2020
//
//  Description: In this exercise, you need to implement a times table of 0..7x0..7
//  using a memory.
//
//  inputs:
//           clk, a[2:0], b[2:0], read
//
//  outputs:
//           result[4:0]
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps


module multiply(
input clk,
input wire [2:0] a,
input wire [2:0] b,
input enable,
output wire [4:0] result);

second your_instance_name (
  .clka(clka),    // input wire clka
  .ena(ena),      // input wire ena
  .wea(wea),      // input wire [0 : 0] wea
  .addra(addra),  // input wire [5 : 0] addra
  .dina(dina),    // input wire [5 : 0] dina
  .douta(douta)  // output wire [5 : 0] douta
);


/*always @(posedge clk)
begin
if(enable)
result = a*b;
end
*/
endmodule

