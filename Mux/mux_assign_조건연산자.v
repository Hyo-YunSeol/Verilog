module mux(iA, iB, iC, iD, iSEL, oOUT);
  input iA, iB, iC, iD;
  input [1:0] iSEL;
  output [7:0] oOUT;
  assign oOUT = (iSEL == 0) ? iA: (iSEL == 1)?iB: (iSEL == 2)? iC:iD;
// iSEL 이 00이면 oOUT이 iA, 01이면 iB, 10이면 iC, 모두 거짓이면 iD
endmodule
