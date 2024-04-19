/*
module FInal2_1(
	input [3:0] A,
	input [3:0] B,
	output [6:0] H1,
	output [6:0] H2,
	output [6:0] H3,
	output [6:0] H4,
	output [6:0] H5,
	output [6:0] H6,
	input clock,
	input reset 
);
//Seven Segment Display Variables
reg [6:0] H;
reg [6:0] I;
reg [6:0] J;
reg [6:0] K;
reg [6:0] L;
reg [6:0] M;
assign H1 = ~H;
assign H2 = ~I;
assign H3 = ~J;
assign H4 = ~K;
assign H5 = ~L;
assign H6 = ~M;

//State Machine Variables
reg [3:0] count;
reg C;
wire [4:0] InputSum;
assign InputSum = A + B;

//Last State Determination 
reg x0;
reg x1;
reg x2;

always@(*)
begin
	casex ({InputSum})
	5'b00000 : C = 1'b0;
	5'bxxxx1 : C = 1'b1;
	5'bxxx1x : C = 1'b1;
	5'bxx1xx : C = 1'b1;
	5'bx1xxx : C = 1'b1;
	5'b1xxxx : C = 1'b1;
	default : C = 1'b0;
	endcase
	if(count == 8'd0)
	begin
		case (A)//seven segment display 1
		4'h0  : H = 7'h3F;
   		4'h1  : H = 7'h06;
		4'h2  : H = 7'h5B;
		4'h3  : H = 7'h4F;
		4'h4  : H = 7'h66;
		4'h5  : H = 7'h6D;
		4'h6  : H = 7'h7D;
		4'h7  : H = 7'h07;
		4'h8  : H = 7'h7F;
		4'h9  : H = 7'h67;
		4'hA  : H = 7'h77;
		4'hB  : H = 7'h7C;
		4'hC  : H = 7'h39;
		4'hD  : H = 7'h5E;
		4'hE  : H = 7'h79;
		4'hF  : H = 7'h71;
		default : H = 7'h00;
		endcase
		case (B)//seven segment display 2
		4'h0  : I = 7'h3F;
   		4'h1  : I = 7'h06;
		4'h2  : I = 7'h5B;
		4'h3  : I = 7'h4F;
		4'h4  : I = 7'h66;
		4'h5  : I = 7'h6D;
		4'h6  : I = 7'h7D;
		4'h7  : I = 7'h07;
		4'h8  : I = 7'h7F;
		4'h9  : I = 7'h67;
		4'hA  : I = 7'h77;
		4'hB  : I = 7'h7C;
		4'hC  : I = 7'h39;
		4'hD  : I = 7'h5E;
		4'hE  : I = 7'h79;
		4'hF  : I = 7'h71;
		default : I = 7'h00;
		endcase
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
		endcase
	end 
	if(count == 8'd1)
	begin
		case (A)//seven segment display 3
		4'h0  : J = 7'h3F;
   		4'h1  : J = 7'h06;
		4'h2  : J = 7'h5B;
		4'h3  : J = 7'h4F;
		4'h4  : J = 7'h66;
		4'h5  : J = 7'h6D;
		4'h6  : J = 7'h7D;
		4'h7  : J = 7'h07;
		4'h8  : J = 7'h7F;
		4'h9  : J = 7'h67;
		4'hA  : J = 7'h77;
		4'hB  : J = 7'h7C;
		4'hC  : J = 7'h39;
		4'hD  : J = 7'h5E;
		4'hE  : J = 7'h79;
		4'hF  : J = 7'h71;
		default : J = 7'h00;
		endcase
		case (B)//seven segment display 4
		4'h0  : K = 7'h3F;
   		4'h1  : K = 7'h06;
		4'h2  : K = 7'h5B;
		4'h3  : K = 7'h4F;
		4'h4  : K = 7'h66;
		4'h5  : K = 7'h6D;
		4'h6  : K = 7'h7D;
		4'h7  : K = 7'h07;
		4'h8  : K = 7'h7F;
		4'h9  : K = 7'h67;
		4'hA  : K = 7'h77;
		4'hB  : K = 7'h7C;
		4'hC  : K = 7'h39;
		4'hD  : K = 7'h5E;
		4'hE  : K = 7'h79;
		4'hF  : K = 7'h71;
		default : K = 7'h00;
		endcase
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
		endcase
	end
	if(count == 8'd2)
	begin
		case (A)//seven segment display 3
		4'h0  : L = 7'h3F;
   		4'h1  : L = 7'h06;
		4'h2  : L = 7'h5B;
		4'h3  : L = 7'h4F;
		4'h4  : L = 7'h66;
		4'h5  : L = 7'h6D;
		4'h6  : L = 7'h7D;
		4'h7  : L = 7'h07;
		4'h8  : L = 7'h7F;
		4'h9  : L = 7'h67;
		4'hA  : L = 7'h77;
		4'hB  : L = 7'h7C;
		4'hC  : L = 7'h39;
		4'hD  : L = 7'h5E;
		4'hE  : L = 7'h79;
		4'hF  : L = 7'h71;
		default : L = 7'h00;
		endcase
		case (B)//seven segment display 4
		4'h0  : M = 7'h3F;
   		4'h1  : M = 7'h06;
		4'h2  : M = 7'h5B;
		4'h3  : M = 7'h4F;
		4'h4  : M = 7'h66;
		4'h5  : M = 7'h6D;
		4'h6  : M = 7'h7D;
		4'h7  : M = 7'h07;
		4'h8  : M = 7'h7F;
		4'h9  : M = 7'h67;
		4'hA  : M = 7'h77;
		4'hB  : M = 7'h7C;
		4'hC  : M = 7'h39;
		4'hD  : M = 7'h5E;
		4'hE  : M = 7'h79;
		4'hF  : M = 7'h71;
		default : M = 7'h00
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
		endcase
	end
	if(count == 8'd3)
	begin
		casex ({x2,x1,x0})
		3'b111 : H = 7'h06, I = 7'h06, J = 7'h06, K = 7'h06, L = 7'h06, M = 7'h06;
		3'b0xx : H = 7'h40, I = 7'h40, J = 7'h40, K = 7'h40, L = 7'h40, M = 7'h40;
		3'bx0x : H = 7'h40, I = 7'h40, J = 7'h40, K = 7'h40, L = 7'h40, M = 7'h40;
		3'bxx0 : H = 7'h40, I = 7'h40, J = 7'h40, K = 7'h40, L = 7'h40, M = 7'h40;
		endcase
	end
end

always @(negedge reset, posedge clock) 
begin

	if (!reset) 
	begin
		count <= 8'd0;
	end 
	else if(!C) 
	begin
		count <= 8'd0;
	end
	else if(C)
	begin //
		if (count > 8'd3) 
		begin //
			count <= 8'd3;
		end 
		else 
		begin
			count <= count + 1'b1;
		end
	end 
	
end
	
endmodule
*/

//----------------------------------

module Finaltest(
	input [3:0] A,
	input [3:0] B,
	output [6:0] H1,
	output [6:0] H2,
	output [6:0] H3,
	output [6:0] H4,
	output [6:0] H5,
	output [6:0] H6,
	input clock,
	input reset 
);
//Seven Segment Display Variables
reg [6:0] H;
reg [6:0] I;
reg [6:0] J;
reg [6:0] K;
reg [6:0] L;
reg [6:0] M;
assign H1 = ~H;
assign H2 = ~I;
assign H3 = ~J;
assign H4 = ~K;
assign H5 = ~L;
assign H6 = ~M;

//State Machine Variables
reg [3:0] count;
reg C;
wire [4:0] InputSum;
assign InputSum = A + B;

//Last State Determination 
reg x0;
reg x1;
reg x2;

always@(*)
begin
	casex ({InputSum})
	5'b00000 : C = 1'b0;
	5'bxxxx1 : C = 1'b1;
	5'bxxx1x : C = 1'b1;
	5'bxx1xx : C = 1'b1;
	5'bx1xxx : C = 1'b1;
	5'b1xxxx : C = 1'b1;
	default : C = 1'b0;
	endcase
	if(count == 8'd0)
	begin
		case (A)//seven segment display 1
		4'h0  : H = 7'h3F;
   		4'h1  : H = 7'h06;
		4'h2  : H = 7'h5B;
		4'h3  : H = 7'h4F;
		4'h4  : H = 7'h66;
		4'h5  : H = 7'h6D;
		4'h6  : H = 7'h7D;
		4'h7  : H = 7'h07;
		4'h8  : H = 7'h7F;
		4'h9  : H = 7'h67;
		4'hA  : H = 7'h77;
		4'hB  : H = 7'h7C;
		4'hC  : H = 7'h39;
		4'hD  : H = 7'h5E;
		4'hE  : H = 7'h79;
		4'hF  : H = 7'h71;
		default : H = 7'h00;
		endcase
		case (B)//seven segment display 2
		4'h0  : I = 7'h3F;
   		4'h1  : I = 7'h06;
		4'h2  : I = 7'h5B;
		4'h3  : I = 7'h4F;
		4'h4  : I = 7'h66;
		4'h5  : I = 7'h6D;
		4'h6  : I = 7'h7D;
		4'h7  : I = 7'h07;
		4'h8  : I = 7'h7F;
		4'h9  : I = 7'h67;
		4'hA  : I = 7'h77;
		4'hB  : I = 7'h7C;
		4'hC  : I = 7'h39;
		4'hD  : I = 7'h5E;
		4'hE  : I = 7'h79;
		4'hF  : I = 7'h71;
		default : I = 7'h00;
		endcase
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
		endcase
	end 
	if(count == 8'd1)
	begin
		case (A)//seven segment display 3
		4'h0  : J = 7'h3F;
   		4'h1  : J = 7'h06;
		4'h2  : J = 7'h5B;
		4'h3  : J = 7'h4F;
		4'h4  : J = 7'h66;
		4'h5  : J = 7'h6D;
		4'h6  : J = 7'h7D;
		4'h7  : J = 7'h07;
		4'h8  : J = 7'h7F;
		4'h9  : J = 7'h67;
		4'hA  : J = 7'h77;
		4'hB  : J = 7'h7C;
		4'hC  : J = 7'h39;
		4'hD  : J = 7'h5E;
		4'hE  : J = 7'h79;
		4'hF  : J = 7'h71;
		default : J = 7'h00;
		endcase
		case (B)//seven segment display 4
		4'h0  : K = 7'h3F;
   		4'h1  : K = 7'h06;
		4'h2  : K = 7'h5B;
		4'h3  : K = 7'h4F;
		4'h4  : K = 7'h66;
		4'h5  : K = 7'h6D;
		4'h6  : K = 7'h7D;
		4'h7  : K = 7'h07;
		4'h8  : K = 7'h7F;
		4'h9  : K = 7'h67;
		4'hA  : K = 7'h77;
		4'hB  : K = 7'h7C;
		4'hC  : K = 7'h39;
		4'hD  : K = 7'h5E;
		4'hE  : K = 7'h79;
		4'hF  : K = 7'h71;
		default : K = 7'h00;
		endcase
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
		endcase
	end
	if(count == 8'd2)
	begin
		case (A)//seven segment display 3
		4'h0  : L = 7'h3F;
   		4'h1  : L = 7'h06;
		4'h2  : L = 7'h5B;
		4'h3  : L = 7'h4F;
		4'h4  : L = 7'h66;
		4'h5  : L = 7'h6D;
		4'h6  : L = 7'h7D;
		4'h7  : L = 7'h07;
		4'h8  : L = 7'h7F;
		4'h9  : L = 7'h67;
		4'hA  : L = 7'h77;
		4'hB  : L = 7'h7C;
		4'hC  : L = 7'h39;
		4'hD  : L = 7'h5E;
		4'hE  : L = 7'h79;
		4'hF  : L = 7'h71;
		default : L = 7'h00;
		endcase
		case (B)//seven segment display 4
		4'h0  : M = 7'h3F;
   		4'h1  : M = 7'h06;
		4'h2  : M = 7'h5B;
		4'h3  : M = 7'h4F;
		4'h4  : M = 7'h66;
		4'h5  : M = 7'h6D;
		4'h6  : M = 7'h7D;
		4'h7  : M = 7'h07;
		4'h8  : M = 7'h7F;
		4'h9  : M = 7'h67;
		4'hA  : M = 7'h77;
		4'hB  : M = 7'h7C;
		4'hC  : M = 7'h39;
		4'hD  : M = 7'h5E;
		4'hE  : M = 7'h79;
		4'hF  : M = 7'h71;
		default : M = 7'h00;
		endcase
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
		endcase
	end
	if(count == 8'd3)
	begin
		casex ({x2,x1,x0})
		3'b111 : begin H = 7'h06; I = 7'h06; J = 7'h06; K = 7'h06; L = 7'h06; M = 7'h06; end
		3'b0xx : begin H = 7'h40; I = 7'h40; J = 7'h40; K = 7'h40; L = 7'h40; M = 7'h40; end
		3'bx0x : begin H = 7'h40; I = 7'h40; J = 7'h40; K = 7'h40; L = 7'h40; M = 7'h40; end
		3'bxx0 : begin H = 7'h40; I = 7'h40; J = 7'h40; K = 7'h40; L = 7'h40; M = 7'h40; end
		endcase
	end
end

always @(negedge reset, posedge clock) 
begin

	if (!reset) 
	begin
		count <= 8'd0;
	end 
	else if(!C) 
	begin
		count <= 8'd0;
	end
	else if(C)
	begin //
		if (count > 8'd3) 
		begin //
			count <= 8'd3;
		end 
		else 
		begin
			count <= count + 1'b1;
		end
	end 
	
end
	
endmodule
