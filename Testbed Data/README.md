# README for 5G-Transmitted IQ Samples Dataset

## Data Storage
![Data Format](https://github.com/ahmed-manavi/Active_Passive_Spectrum_Coexistence_Testbed_Data/assets/95959590/ed6d8b6f-4fc2-4281-95be-976d9c28fca5)

## Overview
This dataset contains IQ samples received by a radiometer, derived from experiments with 5G-transmitted waveforms under various scenarios. These experiments were conducted to facilitate the research on spectrum coexistence between active wireless communication systems and passive sensing technologies.

The dataset includes **raw IQ samples**, **spectral data**, and **calibrated brightness temperature (TB) measurements**. The data is stored in the **Hierarchical Data Format (HDF5)**, which ensures efficient organization and sharing within the scientific community.

---
# Link for Datasets 
- https://bit.ly/4gYfeAV

## Folder Structure
The dataset is organized into the following folders, each representing a specific experimental scenario:
- **`inband_v1`**: Contains data from fully in-band transmission experiments where 5G waveforms were transmitted entirely within the operating bandwidth of the radiometer (1400-1427 MHz).
- **`outband_v1`**: Contains data from out-of-band experiments, where 5G transmissions were conducted outside the radiometer's operational bandwidth.
- **`transitionband_v1`**: Contains data from transition-band experiments, combining both in-band and out-of-band transmissions.

Each folder contains multiple subdirectories named systematically to reflect specific attributes of the experiments, including **resource blocks**, **modulation techniques**, **power gain levels**, and **sample numbers**.

---

## Dataset Attributes
The dataset is categorized into three levels:

1. **Level 0 (L0)**:
   - Raw IQ data split into horizontal polarization (H-pol) and vertical polarization (V-pol).
   - Includes reference sources (`ref1` and `ref2`).

2. **Level 1A (L1A)**:
   - Spectral data derived from raw antenna counts.
   - Includes:
     - Power Spectral Density (PSD).
     - Short Time Fourier Transform (STFT).
   - Data is provided for:
     - Before digital filtering.
     - After digital filtering (−10 MHz to +10 MHz).
     - Internal RFI removed (IRR).

3. **Level 1B (L1B)**:
   - Fully calibrated TB data.
   - Includes spectral time-frequency features and average TB for different polarization states.
   - Ground truth TB data (e.g., anechoic room temperature) is also recorded.

### File Naming Convention
Files are named using a systematic convention for easy identification:
`<transmission_band>_<resource_blocks>_<PowerGain>_<ModulationTechnique>_<SampleNumber>.h5`

**Example**:  
For an out-of-band transmission with 4 RBs, 0 gain, and QPSK modulation in L1B data, the filename will be:  
`outband_4RB_Gain0_QPSK_fc1_rfi_L1B_SN1.h5`

---

## Data Preprocessing
Preprocessing steps applied to the data include:
1. **Integration Time**:
   - A single sample represents 1 second of integration, divided into four 0.25-second states (H-pol, V-pol, ref1, and ref2).
2. **Digital Filtering**:
   - Butterworth low-pass filter (cutoff: 10 MHz) to remove high-frequency noise.
3. **RFI Removal**:
   - An internal RFI detection algorithm was applied to remove unwanted noise and outliers.

---

## Data Access
The dataset can be accessed from the shared OneDrive directory. The structure is as follows:
```
OneDrive/
├── inband_v1/
├── outband_v1/
└── transitionband_v1/
```

---

## Citation
If you use this dataset in your research, please cite:
> Alam, A.M., et al. (2024). *Physical Testbed and Open Dataset for Passive Sensing and Wireless Communication Spectrum Coexistence*. IEEE Access. DOI: [10.1109/ACCESS.2024.3453774](https://doi.org/10.1109/ACCESS.2024.3453774)

---

For questions or contributions, please contact the corresponding author:  
**Vuk Marojevic** - [vuk.marojevic@ece.msstate.edu](mailto:vuk.marojevic@ece.msstate.edu)





# Overall MSU Testbed
![Testbed Picture_1](https://github.com/user-attachments/assets/e8d1aff5-4294-4f7d-9338-dbc9bba128a8)


- 

## Experimental Scenario
![df701e924fi2 pdf-1](https://github.com/ahmed-manavi/Active_Passive_Spectrum_Coexistence_Testbed_Data/assets/95959590/341a1d5f-176a-4da6-819d-39bf7ff6ad9c)
