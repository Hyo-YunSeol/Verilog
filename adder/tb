`timescale 1ns/1ps

module tb_bit_4adder;
  reg [3:0] iX;
  reg [3:0] iY;
  reg iCIN;
  wire oSUM0, oSUM1, oSUM2, oSUM3, oCARRY;

  // DUT ??
  bit_4adder UUT (
    .iX0(iX[0]), .iY0(iY[0]),
    .iX1(iX[1]), .iY1(iY[1]),
    .iX2(iX[2]), .iY2(iY[2]),
    .iX3(iX[3]), .iY3(iY[3]),
    .iCIN(iCIN),
    .oSUM0(oSUM0), .oSUM1(oSUM1), .oSUM2(oSUM2), .oSUM3(oSUM3),
    .oCARRY(oCARRY)
  );

  // SUM ?? (4?? ?)
  wire [3:0] oSUM = {oSUM3, oSUM2, oSUM1, oSUM0};

  integer X, Y;

  initial begin
    $display("Time(ns) | CIN |  X  |  Y  | SUM  | CARRY | DEC");
    $display("------------------------------------------------");
    $monitor("%8t |  %b  | %2d | %2d | %04b |   %b   | %2d",
              $time, iCIN, iX, iY, oSUM, oCARRY, {oCARRY, oSUM});

    // === CIN = 0 ??? ===
    iCIN = 0;
    for (Y = 0; Y < 16; Y = Y + 1) begin
      for (X = 0; X < 16; X = X + 1) begin
        iY = Y;
        iX = X;
        #10;
      end
    end

    // === CIN = 1 ??? ===
    iCIN = 1;
    for (Y = 0; Y < 16; Y = Y + 1) begin
      for (X = 0; X < 16; X = X + 1) begin
        iY = Y;
        iX = X;
        #10;
      end
    end

    $finish;
  end
endmodule
