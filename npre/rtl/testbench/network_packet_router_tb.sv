`timescale 1ns/1ps

module network_packet_router_tb;

    logic       clk;
    logic       rst;
    logic       packet_valid;
    logic [7:0] dest_addr;

    logic       route_valid;
    logic [1:0] output_port;

    // Instantiate DUT
    network_packet_router DUT (
        .clk          (clk),
        .rst          (rst),
        .packet_valid (packet_valid),
        .dest_addr    (dest_addr),
        .route_valid  (route_valid),
        .output_port  (output_port)
    );

    // Clock generation
    initial begin
        clk = 1'b0;

        forever #5 clk = ~clk;
    end

    // Test procedure
    initial begin

        $display("==========================================");
        $display(" Network Packet Routing Engine Testbench");
        $display("==========================================");

        // Initial values
        rst = 1'b1;
        packet_valid = 1'b0;
        dest_addr = 8'h00;

        // Reset
        #12;

        rst = 1'b0;

        // Test PORT 0
        @(negedge clk);
        packet_valid = 1'b1;
        dest_addr = 8'h10;

        @(posedge clk);
        #1;
        $display("Destination = 0x%02h | Output Port = %0d | Route Valid = %b",
                 dest_addr, output_port, route_valid);

        // Test PORT 1
        @(negedge clk);
        dest_addr = 8'h20;

        @(posedge clk);
        #1;
        $display("Destination = 0x%02h | Output Port = %0d | Route Valid = %b",
                 dest_addr, output_port, route_valid);

        // Test PORT 2
        @(negedge clk);
        dest_addr = 8'h30;

        @(posedge clk);
        #1;
        $display("Destination = 0x%02h | Output Port = %0d | Route Valid = %b",
                 dest_addr, output_port, route_valid);

        // Test PORT 3
        @(negedge clk);
        dest_addr = 8'h40;

        @(posedge clk);
        #1;
        $display("Destination = 0x%02h | Output Port = %0d | Route Valid = %b",
                 dest_addr, output_port, route_valid);

        // Test unknown destination
        @(negedge clk);
        dest_addr = 8'h55;

        @(posedge clk);
        #1;
        $display("Destination = 0x%02h | Output Port = %0d | Route Valid = %b",
                 dest_addr, output_port, route_valid);

        // Invalid packet
        @(negedge clk);
        packet_valid = 1'b0;
        dest_addr = 8'h20;

        @(posedge clk);
        #1;
        $display("Invalid Packet | Output Port = %0d | Route Valid = %b",
                 output_port, route_valid);

        #10;

        $display("==========================================");
        $display(" Simulation Completed Successfully");
        $display("==========================================");

        $finish;
    end

endmodule