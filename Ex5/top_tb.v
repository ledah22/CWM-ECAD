//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Traffic Lights
// Student Name:ISIDORA RADENKOVIC
// Date: June 2nd, 2020
//
// Description: A testbench module to test Ex5 - Traffic Lights
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

module traffic_lights_tb();

//Parameters
parameter CLK_Period = 10;


//Registers and wires
reg err;
reg clk;
reg red_prev;
reg amber_prev;
reg green_prev;

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

forever begin
red_prev = red;
amber_prev = amber;
green_prev = green;

#(CLK_Period)

if (!((red_prev && !amber_prev && !green_prev && red && amber && !green)||(red_prev && amber_prev && !green_prev &&   !red && !amber && green)||(!red_prev && !amber_prev && green_prev && !red && amber && !green)||(!red_prev && amber_prev && !green_prev && red && !amber && !green)))

begin
           $display("***TEST FAILED! lights_before=%d-%d-%d but ligths_now = %d-%d-%d***",red_prev, amber_prev, green_prev, red, amber, green);
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
traffic_lights top(.clk (clk), .red (red), .amber (amber), .green (green));

endmodule
