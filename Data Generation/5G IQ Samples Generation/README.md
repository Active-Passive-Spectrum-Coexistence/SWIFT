# 5G IQ Sample Generation and Transmission

![RF Transmission -1](https://github.com/user-attachments/assets/50082d77-6ea6-448a-b4a0-6e64b3273766)

## Overview
This folder provides MATLAB code for generating 5G downlink waveform IQ samples, converting them into binary format, and transmitting them over the air using GNU Radio and USRP. The generated IQ samples are compatible with GNU Radio, where a custom flowgraph reads the binary file and facilitates over-the-air transmission at specified frequencies and gain levels.

## Features
- **IQ sample generation**: Creates 5G downlink waveforms using MATLAB's NR (New Radio) toolbox.
- **Binary conversion**: Converts the generated IQ samples into `.dat` binary format for transmission.
- **GNURadio integration**: Transmits IQ samples using GNU Radio and USRP hardware, allowing control over transmission frequency and gain.

## Workflow
1. **Waveform Generation (MATLAB)**
   - The MATLAB script `Waveform_generation.m` generates 5G downlink IQ samples with configurable parameters such as:
     - Subcarrier spacing
     - Bandwidth
     - Modulation type (e.g., QPSK, 16QAM, 64QAM)
     - Power levels
   - The IQ samples are saved in both `.mat` and `.dat` formats.

2. **Transmission (GNU Radio)**
   - The `.dat` binary file containing IQ samples is fed into the GNU Radio flowgraph `TX.grc`.
   - GNU Radio handles transmission using USRP hardware.
   - Transmission frequency and gain are user-configurable in the GNU Radio flowgraph.

## Configuration Details
### MATLAB Script
- **IQ Sample File Output**:
  - `samplewave_<parameters>.mat`: Contains the waveform.
  - `sample_<parameters>.dat`: Contains the IQ samples in binary format.
  - `sampleinfo_<parameters>.mat`: Contains metadata about the waveform.

### GNU Radio Flowgraph
- **File**: `TX.grc`
- **Inputs**:
  - `.dat` binary IQ sample file.
- **Configurable Parameters**:
  - **Transmission Frequency**: User-defined (e.g., 2.4 GHz).
  - **Transmission Gain**: Typically set to **60** for optimal performance.

## Usage Instructions
### Step 1: Generate IQ Samples
1. Open the MATLAB script `Waveform_generation.m`.
2. Adjust parameters in the script (e.g., modulation type, power level).
3. Run the script to generate IQ samples.
4. Locate the `.dat` binary file in the output directory.

### Step 2: Transmit Using GNU Radio
1. Open the GNU Radio flowgraph `TX.grc`.
2. Load the `.dat` file as the input source.
3. Set the desired transmission frequency and gain (recommended gain: **60**).
4. Run the flowgraph to transmit the IQ samples over the air.

## System Requirements
- **MATLAB** with 5G Toolbox for waveform generation.
- **GNU Radio** for signal processing and USRP transmission.
- **USRP Hardware** compatible with GNU Radio.

## Notes
- Ensure that the transmission frequency complies with local regulatory standards.
- Use proper RF shielding to avoid unintended interference with other devices.
- The sample rate and waveform configurations should match between MATLAB and GNU Radio to ensure compatibility.

## Contact
