module network_packet_router (
    input  logic       clk,
    input  logic       rst,
    input  logic       packet_valid,
    input  logic [7:0] dest_addr,

    output logic       route_valid,
    output logic [1:0] output_port
);

    // Routing table
    localparam logic [7:0] DEST_PORT0 = 8'h10;
    localparam logic [7:0] DEST_PORT1 = 8'h20;
    localparam logic [7:0] DEST_PORT2 = 8'h30;
    localparam logic [7:0] DEST_PORT3 = 8'h40;

    always_ff @(posedge clk) begin
        if (rst) begin
            route_valid <= 1'b0;
            output_port <= 2'b00;
        end
        else begin
            if (packet_valid) begin
                route_valid <= 1'b1;

                case (dest_addr)

                    DEST_PORT0: output_port <= 2'b00;
                    DEST_PORT1: output_port <= 2'b01;
                    DEST_PORT2: output_port <= 2'b10;
                    DEST_PORT3: output_port <= 2'b11;

                    // Default route
                    default: output_port <= 2'b00;

                endcase
            end
            else begin
                route_valid <= 1'b0;
                output_port <= 2'b00;
            end
        end
    end

endmodule