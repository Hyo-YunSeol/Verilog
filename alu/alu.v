module alu (iA, iB, iINST, oRESULT);
  localparam ADD = 4'h0

  , SUB = 4'h1 //덧셈
  , MUL = 4'h2 //뺄셈
  , DIV = 4'h3 //곱셈
  , MOD = 4'h4 //나눗셈
  , BIT_NOT = 4'h5 //나머지
  , BIT_AND = 4'h6 //비트 not
  , BIT_OR = 4'h7 //비트 and
  , BIT_XOR = 4'h8 //비트 or
  , BIT_XNOR = 4'h9 //비트 xnor
  , RED_AND = 4'ha
  , RED_OR = 4'hb // 비트 or
  , RED_XOR = 4'hc //비트 단항 xor
  , RED_NAND = 4'hd // 비트 단항 nand
  , RSHFT = 4'he //비트 단항 우시프트
  , LSHFT = 4'hf;
  //비트 단항 좌시프트;
  input [3:0] iA, iB, iINST;
  output [7:0] oRESULT;

  reg [7:0]result;
  always @ (iA or iB or iINST) begin
    case(iINST)
    ADD : result = iA + iB;
    SUB : result = iA - iB;
    MUL : result = iA * iB;
    DIV : result = iA / iB;
    MOD : result = iA % iB;
    BIT_NOT : result = ~iA;
    BIT_AND : result = iA & iB;
    BIT_OR : result = iA | iB;
    BIT_XOR : result = iA ^ iB;
    BIT_XNOR : result = iA ^~ iB;
    RED_AND : result = &iA;
    RED_OR : result = |iA;
    RED_NAND : result = ~& iA;
    RED_XOR : result = ^iA;
    RSHFT : result = iA >> iB;
    LSHFT : result = iA << iB;
    default : result = 8'h0;
    endcase
  end
  assign oRESULT = result;

endmodule
