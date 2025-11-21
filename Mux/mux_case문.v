
module mux (iA, iB, iC, iD, iSEL, oOUT);
input [7:0] iA, iB, iC, iD;
input [1:0] iSEL;
output [7:0] oOUT;

reg [7:0] out;

always @ (iA or iB or iC or iD or iSEL) begin
    case(iSEL)
    0:out=iA;
    1:out=iB;
    2:out=iC;
    default:out=iD;
    endcase
end
assign oOUT=out;
endmodule
