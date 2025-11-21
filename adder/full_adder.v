module full_adder (iX, iY, iCIN, oSUM, oCARRY);
  input iX, iY, iCIN;
  output oSUM, oCARRY;

  wire s0, c0, c1;
  half_adder ha0 (.iA(iX), .iB(iY), .oS(s0), .oC(c0));
  half_adder ha1 (.iA(s0), .iB(iCIN), .oS(oSUM), .oC(c1));
  assign oCARRY = c0 | c1;

endmodule
