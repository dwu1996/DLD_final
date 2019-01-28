
module elevator (
  output reg door_open,
  output reg Opened,
  output reg[1:0] Direction,  //10 denotes moving up; 01 is moving down; 00 holding still //
  output reg[1:0] Floor,      //00: 1F; 01: 2F; 10: 3F; 11: 4F //
  output reg U1_led,U2_led,D2_led,U3_led,D3_led,D4_led,F1_led,F2_led,F3_led,F4_led,
  input wire U1,U2,D2,U3,D3,D4,
  input wire F1,F2,F3,F4,
  input wire clk,
  input wire rst
);
  
  reg[32:0] count,rec;
  reg[1:0] door_to_open,target;
  reg u1,u2,u3,d2,d3,d4,f1,f2,f3,f4;
  always @(negedge rst) begin
    rec=32'b00000000000000000000000000000000;
    count=32'b00000000000000000000000000000000;
    Direction=2'b00;
	Floor=2'b00;
	door_open=1'b0;
	Opened=1'b0;
	U1_led=1'b0;U2_led=1'b0;D2_led=1'b0;U3_led=1'b0;D3_led=1'b0;D4_led=1'b0;F1_led=1'b0;F2_led=1'b0;F3_led=1'b0;F4_led=1'b0;
  end
  
  always @(posedge clk) begin
    if(count<32'b11111111111111111111111111111111)begin count=count+32'b00000000000000000000000000000001;end
	else begin count=32'b00000000000000000000000000000000; end
  end
  
  always @(posedge clk) begin
    if(U1==1'b1)begin u1=1'b1;U1_led=1'b1;target=2'b00;end
	if(U2==1'b1)begin u2=1'b1;U2_led=1'b1;target=2'b01;end
	if(U3==1'b1)begin u3=1'b1;U3_led=1'b1;target=2'b10;end
	if(D2==1'b1)begin d2=1'b1;D2_led=1'b1;target=2'b01;end
	if(D3==1'b1)begin d3=1'b1;D3_led=1'b1;target=2'b10;end
	if(D4==1'b1)begin d4=1'b1;D4_led=1'b1;target=2'b11;end
	if(F1==1'b1)begin f1=1'b1;F1_led=1'b1;target=2'b00;end
	if(F2==1'b1)begin f2=1'b1;F2_led=1'b1;target=2'b01;end
	if(F3==1'b1)begin f3=1'b1;F3_led=1'b1;target=2'b10;end
	if(F4==1'b1)begin f4=1'b1;F4_led=1'b1;target=2'b11;end
	if(u1==1'b1)begin U1_led=1'b1;target=2'b00;end
	if(u2==1'b1)begin U2_led=1'b1;target=2'b01;end
	if(u3==1'b1)begin U3_led=1'b1;target=2'b10;end
	if(d2==1'b1)begin D2_led=1'b1;target=2'b01;end
	if(d3==1'b1)begin D3_led=1'b1;target=2'b10;end
	if(d4==1'b1)begin D4_led=1'b1;target=2'b11;end
	if(f1==1'b1)begin F1_led=1'b1;target=2'b00;end
	if(f2==1'b1)begin F2_led=1'b1;target=2'b01;end
	if(f3==1'b1)begin F3_led=1'b1;target=2'b10;end
	if(f4==1'b1)begin F4_led=1'b1;target=2'b11;end
  end
  
  always @(posedge clk) begin
    if(Opened==1'b0)
	begin 
	  if(Direction == 2'b00)
	  begin 
	    if(u1==1'b1 || u2==1'b1 || d2==1'b1 || u3==1'b1 || d3==1'b1 || d4==1'b1 || f1==1'b1 || f2==1'b1 || f3==1'b1 || f4==1'b1)
		begin 
		  if(Floor==target)    begin door_open=1'b1;end
		  else if(Floor>target)begin Direction=2'b01;end
		  else                 begin Direction=2'b10;end
		end
	  end
	  else if(Direction == 2'b01)
  	  begin 
	    Floor = Floor - 2'b01;
		Direction = 2'b00;
	  end
	  else if(Direction == 2'b10)
  	  begin 
  	    Floor = Floor + 2'b01;
		Direction = 2'b00;
	  end
	  else begin end
	end
	else
	begin
	  
	end
  end
  
  always @(posedge door_open) begin
    Opened=1'b1;
	door_open=1'b0;
	rec=count+32'b00000000000000000000000000000101;
	if(Floor==2'b00)	   begin u1=1'b0;U1_led=1'b0;f1=1'b0;F1_led=1'b0;Direction=2'b00;end
	  else if(Floor==2'b01)begin u2=1'b0;U2_led=1'b0;d2=1'b0;D2_led=1'b0;f2=1'b0;F2_led=1'b0;Direction=2'b00;end
	  else if(Floor==2'b10)begin u3=1'b0;U3_led=1'b0;d3=1'b0;D3_led=1'b0;f3=1'b0;F3_led=1'b0;Direction=2'b00;end
	  else                 begin d4=1'b0;D4_led=1'b0;f4=1'b0;F4_led=1'b0;Direction=2'b00;end
  end
  
  always @(posedge Opened or posedge clk) begin
    
    if(rec==count && Opened==1'b1)begin Opened=1'b0;end
  end
  
endmodule

