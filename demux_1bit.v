


module demux_1bit(
input data,
input [1:0] sel,
output reg A, B, C, D
    );
    
always @(data, sel) begin
    
    
    case (sel)
    2'b00: A = data;
    2'b01: B = data;
    2'b10: C = data;
    2'b11: D = data;
    
    endcase
 end
    
endmodule
