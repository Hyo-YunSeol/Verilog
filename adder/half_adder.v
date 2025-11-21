module half_adder (iA, iB, oS, oC);
  input iA, iB;
  output oS, oC;
  assign oS = iA ^ iB;
  assign oC = iA & iB;

endmodule

