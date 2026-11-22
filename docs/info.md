<!---
This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.
-->

## How it works

**CEDEC V1** is a mixed-signal **1.8 V VCO-Based $\Sigma\Delta$ ADC** implemented in **SkyWater SKY130A** (130 nm CMOS) for Tiny Tapeout (`1x2` analog tile, `161 µm × 225.76 µm`):

- **Author**: Jakie Wang
- **Supervisor**: Assoc. Prof. Dr. Jagadheswaran (Microelectronic System Engineering, CEDEC)
- **Analog Front-End (`vco_frontend`)**: Differential voltage-to-current OTA + 7-stage current-starved ring VCO + phase-frequency quantizer (`26.4 µW` analog power at `1.8 V`, LVS-clean & 0 SKY130A KLayout DRC violations).
- **Digital Back-End (`vco_sd_digital`)**: 763-cell `sky130_fd_sc_hd` Sinc³ decimation filter with selectable OSR (`ui_in[1:0]`), MSB/LSB byte-mux (`ui_in[2]`), and `data_valid` strobe (`uio_out[0]`).
- **Pre-Layout vs Post-Layout PEX (`OSR = 64`, `fs = 6 MHz`)**: `SNDR = 49.59 dB` (`7.94 ENOB`) Pre-Layout vs `49.09 dB` (`7.86 ENOB`) Post-Layout PEX.
- **Top-Metal (`MET4`) Silicon Inscription**: `Jakie Wang CEDEC V1` / `Assoc. Prof. Dr. Jagadheswaran` / `Microelectronic System Engineering` (0 DRC violations).

## How to test

1. Apply `1.8 V` to `VDPWR` and `0 V` to `VGND`.
2. Supply a `6 MHz` digital clock to `clk` and de-assert `rst_n` (`rst_n = 1`).
3. Apply a `0.72 V` DC bias to `ua[2]` (`vbias`) and a differential analog sine wave (centered at `0.9 V` common-mode, `±80 mV` amplitude) across `ua[0]` (`vin_p`) and `ua[1]` (`vin_n`).
4. Set `ui_in[1:0]` to select the decimation OSR and read the decimated digital output on `uo_out[7:0]` whenever `uio_out[0]` (`data_valid`) pulses high.

## External hardware

Differential analog signal generator (e.g., audio/baseband function generator with `0.9 V` DC offset) and a logic analyzer or microcontroller to capture `uo_out[7:0]` and `uio_out[0]`.
