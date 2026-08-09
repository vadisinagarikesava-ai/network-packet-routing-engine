# Network Packet Routing Engine

A SystemVerilog-based hardware network packet routing engine that examines the destination address of an incoming packet and selects the appropriate output port using a simple routing table.

## Features

* 8-bit destination address
* 4 output ports
* Routing table implemented using combinational logic
* Valid packet input
* Default port for unknown destinations
* Simple and synthesizable RTL design
* Includes a SystemVerilog testbench

## Project Structure

```text
network-packet-routing-engine/
│
├── README.md
├── rtl/
│   └── network_packet_router.sv
│
├── testbench/
│   └── network_packet_router_tb.sv
│
└── output/
    └── expected_output.txt
```

## Working Principle

The router receives an 8-bit destination address.

Based on the destination address, the router selects one of four output ports:

| Destination Address | Output Port |
| ------------------- | ----------- |
| 0x10                | PORT 0      |
| 0x20                | PORT 1      |
| 0x30                | PORT 2      |
| 0x40                | PORT 3      |
| Other               | PORT 0      |

The `packet_valid` signal indicates whether the incoming packet is valid.

## Inputs

| Signal         | Width | Description              |
| -------------- | ----: | ------------------------ |
| `clk`          |     1 | System clock             |
| `rst`          |     1 | Active-high reset        |
| `packet_valid` |     1 | Indicates a valid packet |
| `dest_addr`    |     8 | Destination address      |

## Outputs

| Signal        | Width | Description                        |
| ------------- | ----: | ---------------------------------- |
| `route_valid` |     1 | Indicates a valid routing decision |
| `output_port` |     2 | Selected output port               |

## Port Encoding

```text
2'b00 -> PORT 0
2'b01 -> PORT 1
2'b10 -> PORT 2
2'b11 -> PORT 3
```

## Simulation

The project can be simulated using tools such as:

* Icarus Verilog
* ModelSim
* QuestaSim
* Vivado Simulator

### Using Icarus Verilog

Compile:

```bash
iverilog -g2012 -o router_sim rtl/network_packet_router.sv testbench/network_packet_router_tb.sv
```

Run:

```bash
vvp router_sim
```

## Expected Result

The testbench sends packets with different destination addresses and verifies that the correct output port is selected.

Example:

```text
Destination 0x10 -> PORT 0
Destination 0x20 -> PORT 1
Destination 0x30 -> PORT 2
Destination 0x40 -> PORT 3
Unknown address -> PORT 0
```

## Applications

* Network routers
* Packet switching systems
* Network-on-Chip (NoC)
* FPGA networking projects
* Digital communication systems

## Author

Created as a digital hardware design project using SystemVerilog.
