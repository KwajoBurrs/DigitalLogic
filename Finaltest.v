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
//reg [3:0] count2;
reg C;
wire [4:0] InputSum;
assign InputSum = A + B;

//Last State Determination 
reg x0;
reg x1;
reg x2;

always@(*)
begin


	reg Z;
	reg ZZ;
	reg ZZZ;
	if (A > 4'h9)
	begin
		Z <= 1'b0;
	end
	else
	begin
	Z <= 1'b1;
	end
	
	if (B > 4'h9)
	begin
		ZZZ <= 1'b0;
	end
	else
	begin
	ZZZ <= 1'b1;
	end
	if (Z & ZZ & ZZZ)
		begin
			C <= 1'b1;
		end
	else
	begin
		C <= 1'b0;
	end
	casex ({InputSum})
	5'b00000 : ZZ = 1'b0;
	5'bxxxx1 : ZZ = 1'b1;
	5'bxxx1x : ZZ = 1'b1;
	5'bxx1xx : ZZ = 1'b1;
	5'bx1xxx : ZZ = 1'b1;
	5'b1xxxx : ZZ = 1'b1;
	default : ZZ = 1'b0;
	endcase

	if(count == 8'd0)
	begin
		case (A)//seven segment display 1
		4'h0  : begin H = 7'h3F;J = 7'h00; K = 7'h00; L = 7'h00; M = 7'h00;end
   	4'h1  : begin H = 7'h06;J = 7'h00; K = 7'h00; L = 7'h00; M = 7'h00;end
		4'h2  : begin H = 7'h5B;J = 7'h00; K = 7'h00; L = 7'h00; M = 7'h00;end
		4'h3  : begin H = 7'h4F;J = 7'h00; K = 7'h00; L = 7'h00; M = 7'h00;end
		4'h4  : begin H = 7'h66;J = 7'h00; K = 7'h00; L = 7'h00; M = 7'h00;end
		4'h5  : begin H = 7'h6D;J = 7'h00; K = 7'h00; L = 7'h00; M = 7'h00;end
		4'h6  : begin H = 7'h7D;J = 7'h00; K = 7'h00; L = 7'h00; M = 7'h00;end
		4'h7  : begin H = 7'h07;J = 7'h00; K = 7'h00; L = 7'h00; M = 7'h00;end
		4'h8  : begin H = 7'h7F;J = 7'h00; K = 7'h00; L = 7'h00; M = 7'h00;end
		4'h9  : begin H = 7'h67;J = 7'h00; K = 7'h00; L = 7'h00; M = 7'h00;end
		4'hA  : begin H = 7'h77;J = 7'h00; K = 7'h00; L = 7'h00; M = 7'h00;end
		4'hB  : begin H = 7'h7C;J = 7'h00; K = 7'h00; L = 7'h00; M = 7'h00;end
		4'hC  : begin H = 7'h39;J = 7'h00; K = 7'h00; L = 7'h00; M = 7'h00;end
		4'hD  : begin H = 7'h5E;J = 7'h00; K = 7'h00; L = 7'h00; M = 7'h00;end
		4'hE  : begin H = 7'h79;J = 7'h00; K = 7'h00; L = 7'h00; M = 7'h00;end
		4'hF  : begin H = 7'h71;J = 7'h00; K = 7'h00; L = 7'h00; M = 7'h00;end
		default : begin H = 7'h00;J = 7'h00; K = 7'h00; L = 7'h00; M = 7'h00;end
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
		4'h0  : begin H = 7'h40; I = 7'h40;J = 7'h3F;L = 7'h00; M = 7'h00;end
   	4'h1  : begin H = 7'h40; I = 7'h40;J = 7'h06;L = 7'h00; M = 7'h00;end
		4'h2  : begin H = 7'h40; I = 7'h40;J = 7'h5B;L = 7'h00; M = 7'h00;end
		4'h3  : begin H = 7'h40; I = 7'h40;J = 7'h4F;L = 7'h00; M = 7'h00;end
		4'h4  : begin H = 7'h40; I = 7'h40;J = 7'h66;L = 7'h00; M = 7'h00;end
		4'h5  : begin H = 7'h40; I = 7'h40;J = 7'h6D;L = 7'h00; M = 7'h00;end
		4'h6  : begin H = 7'h40; I = 7'h40;J = 7'h7D;L = 7'h00; M = 7'h00;end
		4'h7  : begin H = 7'h40; I = 7'h40;J = 7'h07;L = 7'h00; M = 7'h00;end
		4'h8  : begin H = 7'h40; I = 7'h40;J = 7'h7F;L = 7'h00; M = 7'h00;end
		4'h9  : begin H = 7'h40; I = 7'h40;J = 7'h67;L = 7'h00; M = 7'h00;end
		4'hA  : begin H = 7'h40; I = 7'h40;J = 7'h77;L = 7'h00; M = 7'h00;end
		4'hB  : begin H = 7'h40; I = 7'h40;J = 7'h7C;L = 7'h00; M = 7'h00;end
		4'hC  : begin H = 7'h40; I = 7'h40;J = 7'h39;L = 7'h00; M = 7'h00;end
		4'hD  : begin H = 7'h40; I = 7'h40;J = 7'h5E;L = 7'h00; M = 7'h00;end
		4'hE  : begin H = 7'h40; I = 7'h40;J = 7'h79;L = 7'h00; M = 7'h00;end
		4'hF  : begin H = 7'h40; I = 7'h40;J = 7'h71;L = 7'h00; M = 7'h00;end
		default : begin H = 7'h40; I = 7'h40;J = 7'h00;L = 7'h00; M = 7'h00;end
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
		4'h0  : begin H = 7'h40; I = 7'h40;J = 7'h40;K = 7'h40;L = 7'h3F;end
   	4'h1  : begin H = 7'h40; I = 7'h40;J = 7'h40;K = 7'h40;L = 7'h06;end
		4'h2  : begin H = 7'h40; I = 7'h40;J = 7'h40;K = 7'h40;L = 7'h5B;end
		4'h3  : begin H = 7'h40; I = 7'h40;J = 7'h40;K = 7'h40;L = 7'h4F;end
		4'h4  : begin H = 7'h40; I = 7'h40;J = 7'h40;K = 7'h40;L = 7'h66;end
		4'h5  : begin H = 7'h40; I = 7'h40;J = 7'h40;K = 7'h40;L = 7'h6D;end
		4'h6  : begin H = 7'h40; I = 7'h40;J = 7'h40;K = 7'h40;L = 7'h7D;end
		4'h7  : begin H = 7'h40; I = 7'h40;J = 7'h40;K = 7'h40;L = 7'h07;end
		4'h8  : begin H = 7'h40; I = 7'h40;J = 7'h40;K = 7'h40;L = 7'h7F;end
		4'h9  : begin H = 7'h40; I = 7'h40;J = 7'h40;K = 7'h40;L = 7'h67;end
		4'hA  : begin H = 7'h40; I = 7'h40;J = 7'h40;K = 7'h40;L = 7'h77;end
		4'hB  : begin H = 7'h40; I = 7'h40;J = 7'h40;K = 7'h40;L = 7'h7C;end
		4'hC  : begin H = 7'h40; I = 7'h40;J = 7'h40;K = 7'h40;L = 7'h39;end
		4'hD  : begin H = 7'h40; I = 7'h40;J = 7'h40;K = 7'h40;L = 7'h5E;end
		4'hE  : begin H = 7'h40; I = 7'h40;J = 7'h40;K = 7'h40;L = 7'h79;end
		4'hF  : begin H = 7'h40; I = 7'h40;J = 7'h40;K = 7'h40;L = 7'h71;end
		default : begin H = 7'h40; I = 7'h40;J = 7'h40;K = 7'h40;L = 7'h00;end
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

	
	if (~reset) 
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