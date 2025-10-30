module memory_system(
input [7:0] data,
input store,
input [1:0] addr,
output [7:0] memory
);

wire [7:0] dataA, dataB, dataC, dataD;
wire storeA, storeB, storeC, storeD;

wire [7:0] memA, memB, memC, memD;


demux data_demux(
.data(data),
.sel(addr),
.A(dataA), .B(dataB), .C(dataC), .D(dataD)
);

demux_1bit store_demux (
.data(store),
.sel(addr),
.A(storeA), .B(storeB), .C(storeC), .D(storeD)
);

byte_memory byteA(.data(dataA), .store(storeA), .memory(memA));
byte_memory byteB(.data(dataB), .store(storeB), .memory(memB));
byte_memory byteC(.data(dataC), .store(storeC), .memory(memC));
byte_memory byteD(.data(dataD), .store(storeD), .memory(memD));



mux byte_mux(
.A(memA), .B(memB), .C(memC), .D(memD),
.sel(addr),
.Y(memory)   
);


endmodule
