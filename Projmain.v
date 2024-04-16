module ProjMain(
	input [3:0] X,
	input [3:0] Y,
	input clock,
	input reset,
	output [6:0] H1,
	output [6:0] H2,
	output [6:0] H3,
	output [6:0] H4,
	output [6:0] H5,
	output [6:0] H6
	);



//start seven segment driver
	reg [6:0] z;
	assign h = ~z;
always@(*)
begin


		
	
	case (a)
	4'h0  : z = 7'h3F;
   	4'h1  : z = 7'h06;
	4'h2  : z = 7'h5B;
	4'h3  : z = 7'h4F;
	4'h4  : z = 7'h66;
	4'h5  : z = 7'h6D;
	4'h6  : z = 7'h7D;
	4'h7  : z = 7'h07;
	4'h8  : z = 7'h7F;
	4'h9  : z = 7'h67;
	4'hA  : z = 7'h77;
	4'hB  : z = 7'h7C;
	4'hC  : z = 7'h39;
	4'hD  : z = 7'h5E;
	4'hE  : z = 7'h79;
	4'hF  : z = 7'h71;
	default : z = 7'h00;
   endcase
//end seven segment display



//start input data intake driver

	//determines the total value of inputs to decide if "0,0" was entered
wire [4:0] InputSum;
assign InputSum = X + Y;
	//state D determinant
wire [2:0] Doutput;
assign Doutput[2] = x2;
assign Doutput[1] = x1;
assign Doutput[0] = x0;

wire C;
wire [1:0] D; //D0 in state machine
wire [1:0] DD; //D1 in state machine
//wire [0:3] DDD; // state machine state




always @(posedge clock)

//deciding input of state machine based on values input to machine "0,0" resets else continue
	
	casex ({InputSum})
		5'b00000 : C = 1'b0;
		5'bxxxx1 : C = 1'b1;
		5'bxxx1x : C = 1'b1;
		5'bxx1xx : C = 1'b1;
		5'bx1xxx : C = 1'b1;
		5'b1xxxx : C = 1'b1;
		default : C = 1'b0;
	endcase
//input storage based on state of state machine [A-D] / [0:3] 
	case ({DD,D})

		2'b00 : 
		2'b01 : 
		2'b10 : 
		2'b11 : 

	





	



//end input data intake driver



