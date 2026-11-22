![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg)

# CEDEC V1 — SKY130A 1.8 V VCO-Based $\Sigma\Delta$ ADC

**Author**: Jakie Wang  
**Technology**: SkyWater SKY130A (130 nm CMOS, `1×2` Tiny Tapeout Analog Tile, `161.0 µm × 225.76 µm`)  
**Top Module**: `tt_um_jamesjakeies_vco_sd_adc`  
**Interactive 3D GDS Viewer**: [https://jamesjakeies.github.io/ttsky-vco-sd-adc/](https://jamesjakeies.github.io/ttsky-vco-sd-adc/)  
**Detailed Documentation**: [docs/info.md](docs/info.md)

---

## Architecture Overview

**CEDEC V1** is a mixed-signal **1.8 V VCO-Based Sigma-Delta ($\Sigma\Delta$) ADC** designed for SkyWater SKY130A:

- **Analog Front-End (`vco_frontend`)**: Differential voltage-to-current OTA + 5-stage current-starved ring VCO + phase-frequency quantizer (`26.4 µW` analog power at `1.8 V`, LVS-clean & 0 DRC).
- **Digital Back-End (`vco_sd_digital`)**: 763-cell `sky130_fd_sc_hd` Sinc³ decimation filter with programmable OSR (`ui_in[1:0]`), output byte multiplexer (`ui_in[2]`), and `data_valid` strobe (`uio_out[0]`).
- **Top-Metal (`MET4`) Silicon Inscription**: `Jakie Wang CEDEC V1`.

## Verified Performance (SKY130A BSIM4, `fs = 6 MHz`, `OSR = 64`)

| Metric | Pre-Layout | Post-Layout PEX |
| :--- | :--- | :--- |
| Supply Voltage | `1.8 V` | `1.8 V` |
| Analog Power | `26.4 µW` | `26.4 µW` |
| SNDR (`Vd = 80 mV`) | `49.59 dB` | `49.09 dB` |
| ENOB | `7.94 bit` | `7.86 bit` |
| Physical Verification | LVS PASS | KLayout & Magic DRC Clean |

## Pinout Summary

| Pin | Direction | Function |
| :--- | :--- | :--- |
| `VDPWR` / `VGND` | Power | `1.8 V` supply / ground |
| `ua[0]` / `ua[1]` | Analog In | Differential analog input (`vin_p` / `vin_n`, `0.9 V` CM) |
| `ua[2]` | Analog In | Bias voltage (`vbias = 0.72 V`) |
| `clk` / `rst_n` | Digital In | `6 MHz` clock / active-low reset |
| `ui_in[1:0]` | Digital In | OSR selection (`osr_sel[1:0]`) |
| `ui_in[2]` | Digital In | Output byte select (`out_sel`) |
| `ui_in[4:3]` | Digital In | `cal_en` / `dwa_en` |
| `uo_out[7:0]` | Digital Out | Decimated ADC output byte (`adc_out[7:0]`) |
| `uio_out[0]` | Digital Out | Decimated output strobe (`data_valid`) |
| `uio_out[1]` | Digital Out | Raw $\Sigma\Delta$ bitstream monitor (`sd_bit_out`) |
