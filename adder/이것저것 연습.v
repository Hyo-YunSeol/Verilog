//덧셈기
module ALU_32 (
  input [31:0]A, 
  input [31:0]B, 
  input [3:0]Cond, 
  output [31:0]Z
  );
  assign Z = A + B;

endmodule
//덧셈기 테스트벤치
module tb_ALU_32;
  reg [31:0]A = 0;
  reg [31:0]B = 0;
  wire [31:0] Z;
  wire [3:0]Cond = 0;
  ALU_32 alu_32(.A(A), .B(B), .Z(Z), .Cond(Cond));
  always #5 A = A+1;

  always #10 B = B+1;

endmodule
//곱셈기
module alu_32 (
  input [31:0]A, 
  input [31:0]B, 
  input [3:0]Cond, 
  output [31:0]Z
  );
  assign Z = A * B;

endmodule
//덧셈기와 뺄셈기
module alu_32(
  input [31:0]A, 
  input [31:0]B, 
  input [3:0]Cond, 
  output [31:0]Z);
  assign Z = Cond == 4'b0000 ? A+B: A-B;

endmodule
// 덧뺄셈기 테스트벤치
module tb_ALU_32;
  reg [31:0]A = 0;
  reg [31:0]B = 0;
  wire [31:0] Z;
  wire [3:0]Cond = 0;
  ALU_32 alu_32(.A(A), .B(B), .Z(Z), .Cond(Cond));
  always #5 A = A+1;

  always #10 B = B+1;

  always #20 Cond = Cond +1;

endmodule
//MUX 구현해보기1: 3항 연산자
module MYMUX32(
  input A, 
  input B, 
  input Cond, 
  output Z
  );
  assign Z = (A&~Cond)|(B&~Cond);

endmodule
//3항 연산자 테스트벤치
module tb_MYMUX32;
  reg A = 0;
  reg B = 0;
  reg Cond = 0;
  wire Z;
  MYMUX32 mymux32_0(.A(A), .B(B), .Cond(Cond), .Z(Z));
  always #1 A = ~A;

  always #2 B = ~B;

  always #4 Cond = ~Cond;

endmodule
//3항연산 2
module MYMUX32(
  input [31:0] A, 
  input [31:0] B, 
  input Cond, 
  output [31:0]Z
  );
  wire [31:0] tCond = {32{Cond}};

  assign Z = (A&~tCond)|(B&tCond);

endmodule
//3항 연산2 테스트벤치
module tb_MYMUX32
  reg [31:0] A = 0;
  reg [31:0] B = 0;
  reg Cond = 0;
  wire [31:0]Z;
  MYMUX32 mymux32_0(.A(A), .B(B), .Cond(Cond), .Z(Z));
  always #1 A = A+1;

  always #2 B = B+2;

  always #4 Cond = ~Cond;

endmodule
//곱셈기 추가버전
module ALU_32(
  input[31:0]A,
  input[31:0]B,
  input[3:0]Cond,
  output[31:0]Z
);
assign Z = Cond==4'b000 ? A+B: Cond==4'b0001 ? A-B: A*B;
endmodule

//always 버전
module alu_32(
  input [31:0]A, 
  input [31:0]B, 
  input [3:0]Cond, 
  output reg [31:0]Z);
  always @ * begin
    case(Cond)
    4'b0000: Z = A + B;
    4'b0001: Z = A - B;
    4'b0010: Z = A * B;
    4'b0011: Z = A / B;
    4'b0100: Z = A % B;
    4'b0101: Z = A | B;
    4'b0110: Z = ~A;
    4'b0111: Z = A ^ B;
    4'b1000: Z = A << B;
    4'b1001: Z = A >> B;
    4'b1010: Z = (A == B);
    4'b1011: Z = (A != B);
    4'b1100: Z = (A > B);
    4'b1101: Z = (A & B);
    4'b1110: Z = (A >= B);
    4'b1111: Z = (A < B);
    default: Z = {{31{1'b0}}, (A<=B)};
    endcase
  end

endmodule
// 테스트벤치 작성iverilog -V
module tb_ALU_32;
  wire [31:0]A;
  wire [31:0]B;
  wire [3:0]Cond;
  wire [31:0] Z;
  ALU_32 alu_32(.A(A), .B(B), .Z(Z), .Cond(Cond));
  always #5 A = A+1;

  always #10 B = B+1;

endmodule
