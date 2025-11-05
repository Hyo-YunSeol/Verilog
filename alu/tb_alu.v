`timescale 1ns/10ps

module tb_alu;
    reg [3:0]iA, iB, iINST;
    wire [7:0] oRESULT;

    integer i; // i를 정수형 변수로 선언

    // 검증할 alu 이름에 의한 포토 맵핑을 사용하여 인스턴스 화

    alu U0 ( .iA(iA), .iB(iB), .iINST(iINST), .oRESULT(oRESULT));

    initial begin
        iA = 4'hb; iB=4'h2;
        iINST= 4'h0;

        for(i=0; i <=15; i= i+1) begin
            #100; iINST = iINST+1; // i가 15까지 참이면 iINST가 1씩 증가
        end
    end
endmodule
