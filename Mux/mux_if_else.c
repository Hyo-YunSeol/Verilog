module mux (iA, iB, iC, iD, iSEL, oOUT);
input iA, iB, iC, iD;
input [1:0] iSEL;
output [7:0] oOUT;

reg [7:0] out;
always @ (iA or iB or iC or iD or iSEL) begin
    if(iSEL==0)
    out=iA;
    else if(iSEL==1)
    out=iB;
    else if(iSEL==2)
    out=iC;
    else
    out=iD;
end

assign oOUT=out;

endmodule
