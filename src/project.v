/*
 * Copyright (c) 2026 Jakie Wang (CEDEC, Microelectronic System Engineering)
 * Supervisor: Assoc. Prof. Dr. Jagadheswaran
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_jamesjakeies_vco_sd_adc (
    input  wire       VGND,
    input  wire       VDPWR,    // 1.8v power supply
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    inout  wire [7:0] ua,       // Analog pins, only ua[5:0] can be used
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock (6 MHz nominal)
    input  wire       rst_n     // reset_n - low to reset
);

    // Custom GDS/LEF mixed-signal macro blackbox for Tiny Tapeout SKY130 (ttsky26d)
    // Analog front-end: 1.8V differential VCO-based Sigma-Delta modulator (LVS & 0-DRC verified)
    // Digital back-end: 763-cell SKY130HD Sinc3 decimation filter & output multiplexer

endmodule
