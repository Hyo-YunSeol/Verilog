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
