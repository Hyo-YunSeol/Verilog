module HA (iA, iB, oS, oC);
  input iA, iB;
  output oS, oC;
  assign oS = iA ^ iB;
  assign oC = iA & iB;
  endmodule
  
  module FA (iA, iB, iC, oS, oC);
  input iA, iB, iC;
  output oS, oC;

  wire w1, w2, w3;
  HA ha_1(.iA(iA), .iB(iB), .oS(w1), .oC(w2));
  HA ha_2(.iA(w1), .iB(iC), .oS(oS), .oC(w3));
  assign oC = w2 | w3;

endmodule

module add (
    input [3:0]A,
    input [3:0]B,
    input iC,
    output [3:0]S,
    output oC
);

wire w1, w2, w3, w4;

FA fa_1(.iA(A[0]), .iB(B[0]), .iC(iC), .oS(S[0]), .oC(w1));
FA fa_2(.iA(A[1]), .iB(B[1]), .iC(w1), .oS(S[1]), .oC(w2));
FA fa_3(.iA(A[2]), .iB(B[2]), .iC(w2), .oS(S[2]), .oC(w3));
FA fa_4(.iA(A[3]), .iB(B[3]), .iC(w3), .oS(S[3]), .oC(w4));

assign oC= w4;
    
endmodule


module sub (
    input [3:0]A,
    input [3:0]B,
    output [3:0]S,
    output oC
);

wire [3:0]w;

FA su_0(.iA(A[0]), .iB(~B[0]), .iC(1'b1),   .oS(S[0]), .oC(w[0]));
FA su_1(.iA(A[1]), .iB(~B[1]), .iC(w[0]), .oS(S[1]), .oC(w[1]));
FA su_2(.iA(A[2]), .iB(~B[2]), .iC(w[1]), .oS(S[2]), .oC(w[2]));
FA su_3(.iA(A[3]), .iB(~B[3]), .iC(w[2]), .oS(S[3]), .oC(w[3]));
    
assign oC= ~w[3];

endmodule
