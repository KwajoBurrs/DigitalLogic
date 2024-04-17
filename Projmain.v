module ProjMain(
	input [3:0] A,
	input [3:0] B,
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


	case ({DD,D})

		2'b00 : DDD = 2'b00
		2'b01 : DDD = 2'b01
		2'b10 : DDD = 2'b10
		2'b11 : DDD = 2'b11
	endcase
end

always@(DDD[0])
begin
			
	case (A)

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
	
	case (B)

	4'h0  : zz = 7'h3F;
   	4'h1  : zz = 7'h06;
	4'h2  : zz = 7'h5B;
	4'h3  : zz = 7'h4F;
	4'h4  : zz = 7'h66;
	4'h5  : zz = 7'h6D;
	4'h6  : zz = 7'h7D;
	4'h7  : zz = 7'h07;
	4'h8  : zz = 7'h7F;
	4'h9  : zz = 7'h67;
	4'hA  : zz = 7'h77;
	4'hB  : zz = 7'h7C;
	4'hC  : zz = 7'h39;
	4'hD  : zz = 7'h5E;
	4'hE  : zz = 7'h79;
	4'hF  : zz = 7'h71;
	default : z = 7'h00;
	endcase

	//start determination of corect input "different by case/state"
	casex ({A,B})

	8'b00101000 : x2 = 1'b1; //"28"
	8'bxxxxxxx1 : x2 = 1'b0;
	8'bxxxxxx1x : x2 = 1'b0;
	8'bxxxxx1xx : x2 = 1'b0;
	8'bxxxx0xxx : x2 = 1'b0;
	8'bxxx1xxxx : x2 = 1'b0;
	8'bxx0xxxxx : x2 = 1'b0;
	8'bx1xxxxxx : x2 = 1'b0;
	8'b1xxxxxxx : x2 = 1'b0;
	end
		
always@(DDD[1])
begin
			
	case (A)

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
	case (B)

	4'h0  : zz = 7'h3F;
   	4'h1  : zz = 7'h06;
	4'h2  : zz = 7'h5B;
	4'h3  : zz = 7'h4F;
	4'h4  : zz = 7'h66;
	4'h5  : zz = 7'h6D;
	4'h6  : zz = 7'h7D;
	4'h7  : zz = 7'h07;
	4'h8  : zz = 7'h7F;
	4'h9  : zz = 7'h67;
	4'hA  : zz = 7'h77;
	4'hB  : zz = 7'h7C;
	4'hC  : zz = 7'h39;
	4'hD  : zz = 7'h5E;
	4'hE  : zz = 7'h79;
	4'hF  : zz = 7'h71;
	default : z = 7'h00;
	endcase

	//start determination of corect input "different by case/state"
	casex ({A,B})

	8'b00011001 : x1 = 1'b1; //"19"
	8'bxxxxxxx0 : x1 = 1'b0;
	8'bxxxxxx1x : x1 = 1'b0;
	8'bxxxxx1xx : x1 = 1'b0;
	8'bxxxx0xxx : x1 = 1'b0;
	8'bxxx0xxxx : x1 = 1'b0;
	8'bxx1xxxxx : x1 = 1'b0;
	8'bx1xxxxxx : x1 = 1'b0;
	8'b1xxxxxxx : x1 = 1'b0;
	end

end


always@(DDD[2])
begin
			
	case (A)

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

	case (B)

	4'h0  : zz = 7'h3F;
   	4'h1  : zz = 7'h06;
	4'h2  : zz = 7'h5B;
	4'h3  : zz = 7'h4F;
	4'h4  : zz = 7'h66;
	4'h5  : zz = 7'h6D;
	4'h6  : zz = 7'h7D;
	4'h7  : zz = 7'h07;
	4'h8  : zz = 7'h7F;
	4'h9  : zz = 7'h67;
	4'hA  : zz = 7'h77;
	4'hB  : zz = 7'h7C;
	4'hC  : zz = 7'h39;
	4'hD  : zz = 7'h5E;
	4'hE  : zz = 7'h79;
	4'hF  : zz = 7'h71;
	default : z = 7'h00;
	endcase

	//start determination of corect input "different by case/state"
	casex ({A,B})

	8'b10010110 : x0 = 1'b1; //"96"
	8'bxxxxxxx1 : x0 = 1'b0;
	8'bxxxxxx0x : x0 = 1'b0;
	8'bxxxxx0xx : x0 = 1'b0;
	8'bxxxx1xxx : x0 = 1'b0;
	8'bxxx0xxxx : x0 = 1'b0;
	8'bxx1xxxxx : x0 = 1'b0;
	8'bx1xxxxxx : x0 = 1'b0;
	8'b0xxxxxxx : x0 = 1'b0;
	end

end

//final case that determines if the state should reflect an unlock or wrong input 

always@(DDD[3])
begin
	//determination if the inputs in state 1-3 were correct
	casex (x)

	3'b111 : zzz = 7'h



	
	case (A)

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

	
	case (B)

	4'h0  : zz = 7'h3F;
   	4'h1  : zz = 7'h06;
	4'h2  : zz = 7'h5B;
	4'h3  : zz = 7'h4F;
	4'h4  : zz = 7'h66;
	4'h5  : zz = 7'h6D;
	4'h6  : zz = 7'h7D;
	4'h7  : zz = 7'h07;
	4'h8  : zz = 7'h7F;
	4'h9  : zz = 7'h67;
	4'hA  : zz = 7'h77;
	4'hB  : zz = 7'h7C;
	4'hC  : zz = 7'h39;
	4'hD  : zz = 7'h5E;
	4'hE  : zz = 7'h79;
	4'hF  : zz = 7'h71;
	default : z = 7'h00;
	endcase


end	
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
wire [0:3] DDD; // state machine state




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
	


							









		
	





	



//end input data intake driver



