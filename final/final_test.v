`timescale 1ns/100ps
module stimulus;
  
  integer cycle;
  reg clk,rst;
  wire door_open,Opened;
  wire[1:0] Direction,Floor;
  wire U1_led,U2_led,D2_led,U3_led,D3_led,D4_led,F1_led,F2_led,F3_led,F4_led;
  reg U1,U2,D2,U3,D3,D4;
  reg F1,F2,F3,F4;
  
  parameter cyc = 10;
  parameter delay = 2;
  
  elevator ele(
    .door_open(door_open),
    .Opened(Opened),
    .Direction(Direction),
	.Floor(Floor),
    .U1_led(U1_led),
    .U2_led(U2_led),
	.D2_led(D2_led),
	.U3_led(U3_led),
	.D3_led(D3_led),
	.D4_led(D4_led),
	.F1_led(F1_led),
	.F2_led(F2_led),
	.F3_led(F3_led),
	.F4_led(F4_led),
	.U1(U1),
	.U2(U2),
	.D2(D2),
	.U3(U3),
	.D3(D3),
	.D4(D4),
	.F1(F1),
	.F2(F2),
	.F3(F3),
	.F4(F4),
    .clk(clk),
	.rst(rst)
  );
  
  always #(cyc/2) clk = ~clk;
  always @(posedge clk) begin
    cycle=cycle+1;
  end
  
  initial begin
    cycle = 0; clk = 0; U1 = 0 ; U2 = 0; D2 = 0; U3 = 0; D3 = 0; D4 = 0;
    F1 = 0; F2 = 0 ; F3 = 0; F4 = 0; rst = 1;
	#(delay);
	#(cyc/2);
	#(cyc*2) rst = 0;
    #(cyc*2) rst = 1;
	
	
	$display("\nCycle %d:\ndoor_open = %b, Opened = %b, Direction = %b, Floor = %b\n",cycle,door_open,Opened,Direction,Floor);
	$display("   U1_led = %b, U2_led = %b, U3_led = %b\n",U1_led,U2_led,U3_led);
	$display("                D2_led = %b, D3_led = %b, D4_led = %b\n",D2_led,D3_led,D4_led);
	$display("   F1_led = %b, F2_led = %b, F3_led = %b, F4_led = %b\n",F1_led,F2_led,F3_led,F4_led);
	#(cyc) U1 = 1;
	$display("\nCycle %d:\ndoor_open = %b, Opened = %b, Direction = %b, Floor = %b\n",cycle,door_open,Opened,Direction,Floor);
	$display("   U1_led = %b, U2_led = %b, U3_led = %b\n",U1_led,U2_led,U3_led);
	$display("                D2_led = %b, D3_led = %b, D4_led = %b\n",D2_led,D3_led,D4_led);
	$display("   F1_led = %b, F2_led = %b, F3_led = %b, F4_led = %b\n",F1_led,F2_led,F3_led,F4_led);
	#(cyc);
	$display("\nCycle %d:\ndoor_open = %b, Opened = %b, Direction = %b, Floor = %b\n",cycle,door_open,Opened,Direction,Floor);
	$display("   U1_led = %b, U2_led = %b, U3_led = %b\n",U1_led,U2_led,U3_led);
	$display("                D2_led = %b, D3_led = %b, D4_led = %b\n",D2_led,D3_led,D4_led);
	$display("   F1_led = %b, F2_led = %b, F3_led = %b, F4_led = %b\n",F1_led,F2_led,F3_led,F4_led);
	#(cyc) U1 = 0; F2 = 1;
	$display("\nCycle %d:\ndoor_open = %b, Opened = %b, Direction = %b, Floor = %b\n",cycle,door_open,Opened,Direction,Floor);
	$display("   U1_led = %b, U2_led = %b, U3_led = %b\n",U1_led,U2_led,U3_led);
	$display("                D2_led = %b, D3_led = %b, D4_led = %b\n",D2_led,D3_led,D4_led);
	$display("   F1_led = %b, F2_led = %b, F3_led = %b, F4_led = %b\n",F1_led,F2_led,F3_led,F4_led);
	#(cyc) F2 = 0; 
	$display("\nCycle %d:\ndoor_open = %b, Opened = %b, Direction = %b, Floor = %b\n",cycle,door_open,Opened,Direction,Floor);
	$display("   U1_led = %b, U2_led = %b, U3_led = %b\n",U1_led,U2_led,U3_led);
	$display("                D2_led = %b, D3_led = %b, D4_led = %b\n",D2_led,D3_led,D4_led);
	$display("   F1_led = %b, F2_led = %b, F3_led = %b, F4_led = %b\n",F1_led,F2_led,F3_led,F4_led);
	#(cyc);
	$display("\nCycle %d:\ndoor_open = %b, Opened = %b, Direction = %b, Floor = %b\n",cycle,door_open,Opened,Direction,Floor);
	$display("   U1_led = %b, U2_led = %b, U3_led = %b\n",U1_led,U2_led,U3_led);
	$display("                D2_led = %b, D3_led = %b, D4_led = %b\n",D2_led,D3_led,D4_led);
	$display("   F1_led = %b, F2_led = %b, F3_led = %b, F4_led = %b\n",F1_led,F2_led,F3_led,F4_led);
	#(cyc);
	$display("\nCycle %d:\ndoor_open = %b, Opened = %b, Direction = %b, Floor = %b\n",cycle,door_open,Opened,Direction,Floor);
	$display("   U1_led = %b, U2_led = %b, U3_led = %b\n",U1_led,U2_led,U3_led);
	$display("                D2_led = %b, D3_led = %b, D4_led = %b\n",D2_led,D3_led,D4_led);
	$display("   F1_led = %b, F2_led = %b, F3_led = %b, F4_led = %b\n",F1_led,F2_led,F3_led,F4_led);
	#(cyc) D3 = 1; D4 = 1;
	$display("\nCycle %d:\ndoor_open = %b, Opened = %b, Direction = %b, Floor = %b\n",cycle,door_open,Opened,Direction,Floor);
	$display("   U1_led = %b, U2_led = %b, U3_led = %b\n",U1_led,U2_led,U3_led);
	$display("                D2_led = %b, D3_led = %b, D4_led = %b\n",D2_led,D3_led,D4_led);
	$display("   F1_led = %b, F2_led = %b, F3_led = %b, F4_led = %b\n",F1_led,F2_led,F3_led,F4_led);
	#(cyc) D3 = 0; D4 = 0;
	$display("\nCycle %d:\ndoor_open = %b, Opened = %b, Direction = %b, Floor = %b\n",cycle,door_open,Opened,Direction,Floor);
	$display("   U1_led = %b, U2_led = %b, U3_led = %b\n",U1_led,U2_led,U3_led);
	$display("                D2_led = %b, D3_led = %b, D4_led = %b\n",D2_led,D3_led,D4_led);
	$display("   F1_led = %b, F2_led = %b, F3_led = %b, F4_led = %b\n",F1_led,F2_led,F3_led,F4_led);
	#(cyc) F2 = 1; F1 = 1;
	$display("\nCycle %d:\ndoor_open = %b, Opened = %b, Direction = %b, Floor = %b\n",cycle,door_open,Opened,Direction,Floor);
	$display("   U1_led = %b, U2_led = %b, U3_led = %b\n",U1_led,U2_led,U3_led);
	$display("                D2_led = %b, D3_led = %b, D4_led = %b\n",D2_led,D3_led,D4_led);
	$display("   F1_led = %b, F2_led = %b, F3_led = %b, F4_led = %b\n",F1_led,F2_led,F3_led,F4_led);
	#(cyc) F2 = 0; F1 = 0;
	$display("\nCycle %d:\ndoor_open = %b, Opened = %b, Direction = %b, Floor = %b\n",cycle,door_open,Opened,Direction,Floor);
	$display("   U1_led = %b, U2_led = %b, U3_led = %b\n",U1_led,U2_led,U3_led);
	$display("                D2_led = %b, D3_led = %b, D4_led = %b\n",D2_led,D3_led,D4_led);
	$display("   F1_led = %b, F2_led = %b, F3_led = %b, F4_led = %b\n",F1_led,F2_led,F3_led,F4_led);
	#(cyc);
	$display("\nCycle %d:\ndoor_open = %b, Opened = %b, Direction = %b, Floor = %b\n",cycle,door_open,Opened,Direction,Floor);
	$display("   U1_led = %b, U2_led = %b, U3_led = %b\n",U1_led,U2_led,U3_led);
	$display("                D2_led = %b, D3_led = %b, D4_led = %b\n",D2_led,D3_led,D4_led);
	$display("   F1_led = %b, F2_led = %b, F3_led = %b, F4_led = %b\n",F1_led,F2_led,F3_led,F4_led);
	#(cyc) U1 = 1;
	$display("\nCycle %d:\ndoor_open = %b, Opened = %b, Direction = %b, Floor = %b\n",cycle,door_open,Opened,Direction,Floor);
	$display("   U1_led = %b, U2_led = %b, U3_led = %b\n",U1_led,U2_led,U3_led);
	$display("                D2_led = %b, D3_led = %b, D4_led = %b\n",D2_led,D3_led,D4_led);
	$display("   F1_led = %b, F2_led = %b, F3_led = %b, F4_led = %b\n",F1_led,F2_led,F3_led,F4_led);
	#(cyc);
	$display("\nCycle %d:\ndoor_open = %b, Opened = %b, Direction = %b, Floor = %b\n",cycle,door_open,Opened,Direction,Floor);
	$display("   U1_led = %b, U2_led = %b, U3_led = %b\n",U1_led,U2_led,U3_led);
	$display("                D2_led = %b, D3_led = %b, D4_led = %b\n",D2_led,D3_led,D4_led);
	$display("   F1_led = %b, F2_led = %b, F3_led = %b, F4_led = %b\n",F1_led,F2_led,F3_led,F4_led);
	#(cyc) U1 = 0;
	$display("\nCycle %d:\ndoor_open = %b, Opened = %b, Direction = %b, Floor = %b\n",cycle,door_open,Opened,Direction,Floor);
	$display("   U1_led = %b, U2_led = %b, U3_led = %b\n",U1_led,U2_led,U3_led);
	$display("                D2_led = %b, D3_led = %b, D4_led = %b\n",D2_led,D3_led,D4_led);
	$display("   F1_led = %b, F2_led = %b, F3_led = %b, F4_led = %b\n",F1_led,F2_led,F3_led,F4_led);
	#(cyc)  F4 = 1;
	$display("\nCycle %d:\ndoor_open = %b, Opened = %b, Direction = %b, Floor = %b\n",cycle,door_open,Opened,Direction,Floor);
	$display("   U1_led = %b, U2_led = %b, U3_led = %b\n",U1_led,U2_led,U3_led);
	$display("                D2_led = %b, D3_led = %b, D4_led = %b\n",D2_led,D3_led,D4_led);
	$display("   F1_led = %b, F2_led = %b, F3_led = %b, F4_led = %b\n",F1_led,F2_led,F3_led,F4_led);
	#(cyc); F4 = 0;
	
	repeat (250)
	begin
	$display("\nCycle %d:\ndoor_open = %b, Opened = %b, Direction = %b, Floor = %b\n",cycle,door_open,Opened,Direction,Floor);
	$display("   U1_led = %b, U2_led = %b, U3_led = %b\n",U1_led,U2_led,U3_led);
	$display("                D2_led = %b, D3_led = %b, D4_led = %b\n",D2_led,D3_led,D4_led);
	$display("   F1_led = %b, F2_led = %b, F3_led = %b, F4_led = %b\n",F1_led,F2_led,F3_led,F4_led);
	#(cyc);
	end
	
	$finish;
  end

  // Dumping the waveform
  initial begin
    $fsdbDumpfile("final.fsdb");
    $fsdbDumpvars;
  end

endmodule
