`timescale 1ns/10ps
module tb_decoder;
  reg [3:0]iIN;
  wire [9:0]oOUT;
  integer i;
  decoder U0 (.iIN(iIN), .oOUT(oOUT));
  initial begin
    iIN = 0;
    for (i = 0;
    i<=9;
    i = i + 1) #100 iIN = iIN + 1;
  end

endmodule
