`timescale 1ns/1ps

module tb_gates;
  reg iA, iB;
  wire oAND, oOR, oNOT, oNAND, oNAND2;
  
  gates U0 (
  .iA (iA),
  .iB (iB),
  .oAND (oAND),
  .oOR (oOR),
  .oNOT (oNOT),
  .oNAND (oNAND),
  .oNAND2 (oNAND2));
  
  initial begin
    iA=0; iB=0; #100;
    iA=0; iB=1; #100;
    iA=1; iB=0; #100;
    iA=1; iB=1; #100;
    $stop;
  end
endmodule
