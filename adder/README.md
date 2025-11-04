### adder

```c
module half_adder (iA, iB, oS, oC);
  input iA, iB;
  output oS, oC;
  assign oS = iA ^ iB;
  assign oC = iA & iB;

endmodule

module full_adder (iX, iY, iCIN, oSUM, oCARRY);
  input iX, iY, iCIN;
  output oSUM, oCARRY;

  wire s0, c0, c1;
  half_adder ha0 (.iA(iX), .iB(iY), .oS(s0), .oC(c0));
  half_adder ha1 (.iA(s0), .iB(iCIN), .oS(oSUM), .oC(c1));
  assign oCARRY = c0 | c1;

endmodule

module bit_4adder(iX0, iY0, iX1, iY1, iX2, iY2, iX3, iY3, iCIN, oSUM0, oSUM1, oSUM2, oSUM3, oCARRY);
  input iX0, iY0, iX1, iY1, iX2, iY2, iX3, iY3, iCIN;
  output oSUM0, oSUM1, oSUM2, oSUM3, oCARRY;

  wire c0, c1, c2, c3;
  full_adder fa0(.iX(iX0), .iY(iY0), .iCIN(iCIN), .oSUM(oSUM0), .oCARRY(c0));
  full_adder fa1(.iX(iX1), .iY(iY1), .iCIN(c0), .oSUM(oSUM1), .oCARRY(c1));
  full_adder fa2(.iX(iX2), .iY(iY2), .iCIN(c1), .oSUM(oSUM2), .oCARRY(c2));
  full_adder fa3(.iX(iX3), .iY(iY3), .iCIN(c2), .oSUM(oSUM3), .oCARRY(oCARRY));
  assign oCARRY = c3;

endmodule

```

###xdc
