module BrentKung16bit(a,b,Cin,Sum,Cout);

input [15:0] a,b;
output [15:0] Sum;
input Cin;
output Cout;

wire [15:0] P1,G1;
wire [7:0] P2,G2;
wire [3:0] P3,G3;
wire [1:0] P4,G4;
wire [0:0] P5,G5;
wire [16:0] C;

genvar i;
generate
for(i=0;i<=15;i=i+1)
begin : Stage_1
	GEN  A(a[i],b[i],G1[i]);
	PROP  X(a[i],b[i],P1[i]);
end
endgenerate


generate
for(i=0;i<=7;i=i+1)
begin : Stage_2	
	BlackCell  bc(G1[2*i+1],P1[2*i+1],G1[2*i],G2[i]);
	GEN  g(P1[2*i+1],P1[2*i],P2[i]);
end
endgenerate

generate
for(i=0;i<=3;i=i+1)
begin : Stage_3	
	BlackCell  bc(G2[2*i+1],P2[2*i+1],G2[2*i],G3[i]);
	GEN  g(P2[2*i+1],P2[2*i],P3[i]);
end
endgenerate


generate
for(i=0;i<=1;i=i+1)
begin : Stage_4
	BlackCell  bc(G3[2*i+1],P3[2*i+1],G3[2*i],G4[i]);
	GEN  g(P3[2*i+1],P3[2*i],P4[i]);
end
endgenerate

generate
for(i=0;i<=0;i=i+1)
begin : Stage_5
	BlackCell  bc(G4[2*i+1],P4[2*i+1],G4[2*i],G5[i]);
	GEN  g(P4[2*i+1],P4[2*i],P5[i]);
end
endgenerate

assign C[0] = Cin;
assign C[1] = G1[0] | (P1[0]&C[0]);
assign C[2] = G2[0] | (P2[0]&C[0]);
assign C[4] = G3[0] | (P3[0]&C[0]);
assign C[8] = G4[0] | (P4[0]&C[0]);
assign C[16] = G5[0] | (P5[0]&C[0]);
assign C[3] = G1[2] | (P1[2]&C[2]);
assign C[5] = G1[4] | (P1[4]&C[4]);
assign C[9] = G1[8] | (P1[8]&C[8]);
assign C[6] = G2[2] | (P2[2]&C[4]);
assign C[10] = G2[4] | (P2[4]&C[8]);
assign C[12] = G3[2] | (P3[2]&C[8]);
assign C[7] = G1[6] | (P1[6]&C[6]);
assign C[11] = G1[10] | (P1[10]&C[10]);
assign C[13] = G1[12] | (P1[12]&C[12]);
assign C[14] = G2[6] | (P2[6]&C[12]);
assign C[15] = G1[14] | (P1[14]&C[14]);
assign Sum[15:0] = P1[15:0] ^ C[15:0];
assign Cout = C[16];
endmodule 