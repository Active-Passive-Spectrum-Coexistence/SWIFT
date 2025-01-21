%% Generate Downlink Waveform
% Configuration of the downlink carrier parameters
cfgDL = nrDLCarrierConfig('FrequencyRange', 'FR1', ... % Frequency range is FR1 (sub-6 GHz)
    'ChannelBandwidth', 25, ... % Channel bandwidth of 25 MHz
    'NCellID', 1, ... % Cell identity number
    'NumSubframes', 10); % Number of subframes in the waveform

% Setting optional parameters for the downlink carrier
cfgDL.WindowingPercent = 0; % No windowing applied
cfgDL.SampleRate = []; % Use default sample rate
cfgDL.CarrierFrequency = 0; % Carrier frequency set to 0 Hz (baseband)

% Configure subcarrier spacing (SCS) and grid size
scs1 = nrSCSCarrierConfig( ...
    'SubcarrierSpacing', 15, ... % Subcarrier spacing of 15 kHz
    'NSizeGrid', 133, ... % Number of resource blocks (RBs) in the grid
    'NStartGrid', 0); % Start of the grid at position 0
cfgDL.SCSCarriers  = {scs1}; % Assign subcarrier configuration to the downlink

% Configure bandwidth parts (BWPs)
bwp1 = nrWavegenBWPConfig( ...
    'BandwidthPartID', 1, ... % Unique ID for the BWP
    'Label', 'BWP1', ... % Label for the BWP
    'SubcarrierSpacing', 15, ... % Subcarrier spacing of 15 kHz
    'CyclicPrefix', 'normal', ... % Use normal cyclic prefix
    'NSizeBWP', 133, ... % Size of the BWP (in RBs)
    'NStartBWP', 0); % Starting position of the BWP
cfgDL.BandwidthParts  = {bwp1}; % Assign BWP configuration to the downlink

% Configure the SS Burst (Synchronization Signal Burst)
ssBurst1 = nrWavegenSSBurstConfig( ...
    'BlockPattern', 'Case A', ... % Specify block pattern (Case A)
    'TransmittedBlocks', [1 1 1 1], ... % All four blocks transmitted
    'Period', 20, ... % SS Burst periodicity
    'NCRBSSB', [], ... % Number of RBs for SS Burst is default
    'KSSB', 0, ... % Subcarrier offset for SS Burst
    'DataSource', 'MIB', ... % Data source for MIB transmission
    'DMRSTypeAPosition', 2, ... % DMRS Type A position
    'CellBarred', false, ... % Cell is not barred
    'IntraFreqReselection', false, ... % No intra-frequency reselection
    'PDCCHConfigSIB1', 0, ... % PDCCH configuration for SIB1
    'SubcarrierSpacingCommon', 15, ... % Common subcarrier spacing
    'Enable', false, ... % SS Burst is disabled
    'Power', 0); % Power of SS Burst
cfgDL.SSBurst  = ssBurst1; % Assign SS Burst configuration to the downlink

% Configure CORESET (Control Resource Set)
coreset1 = nrCORESETConfig( ...
    'CORESETID', 0, ... % CORESET ID
    'Label', 'CORESET0', ... % Label for CORESET0
    'FrequencyResources', [1 0 0 0 0 0 0 0], ... % Frequency resources bitmap
    'Duration', 2, ... % Duration of CORESET in symbols
    'CCEREGMapping', 'interleaved', ... % Mapping of CCEs to REGs
    'REGBundleSize', 2, ... % REG bundle size
    'InterleaverSize', 2, ... % Interleaver size
    'ShiftIndex', 0); % Shift index for REG mapping
coreset2 = nrCORESETConfig( ...
    'CORESETID', 1, ... % CORESET ID
    'Label', 'CORESET1', ... % Label for CORESET1
    'FrequencyResources', [1 0 0 0 0 0 0 0], ... % Frequency resources bitmap
    'Duration', 2, ... % Duration of CORESET in symbols
    'CCEREGMapping', 'interleaved', ... % Mapping of CCEs to REGs
    'REGBundleSize', 2, ... % REG bundle size
    'InterleaverSize', 2, ... % Interleaver size
    'ShiftIndex', 0); % Shift index for REG mapping
cfgDL.CORESET  = {coreset1, coreset2}; % Assign CORESET configurations to the downlink

% Configure Search Spaces
searchSpaces1 = nrSearchSpaceConfig( ...
    'SearchSpaceID', 1, ... % Search Space ID
    'Label', 'SearchSpace1', ... % Label for the search space
    'CORESETID', 1, ... % CORESET ID associated with this search space
    'SearchSpaceType', 'ue', ... % UE-specific search space
    'StartSymbolWithinSlot', 0, ... % Start symbol within a slot
    'SlotPeriodAndOffset', [1 0], ... % Slot periodicity and offset
    'Duration', 1, ... % Duration of the search space
    'NumCandidates', [2 0 0 0 0]); % Number of PDCCH candidates
cfgDL.SearchSpaces  = {searchSpaces1}; % Assign search space configuration to the downlink

% Configure PDCCH (Physical Downlink Control Channel)
pdcch1 = nrWavegenPDCCHConfig( ...
    'Enable', false, ... % Disable PDCCH
    'Label', 'PDCCH1', ... % Label for PDCCH
    'Power', -15, ... % Power of the PDCCH
    'BandwidthPartID', 1, ... % Associated BWP ID
    'SearchSpaceID', 1, ... % Associated search space ID
    'AggregationLevel', 1, ... % Aggregation level
    'AllocatedCandidate', 1, ... % Allocated candidate
    'SlotAllocation', 0, ... % Slot allocation
    'Period', 1, ... % Periodicity
    'Coding', true, ... % Enable coding
    'DataBlockSize', 20, ... % Size of the data block
    'DataSource', 'PN9-ITU', ... % Data source for the PDCCH
    'RNTI', 1, ... % Radio Network Temporary Identifier
    'DMRSScramblingID', 2, ... % Scrambling ID for DMRS
    'DMRSPower', 0); % Power of DMRS
cfgDL.PDCCH  = {pdcch1}; % Assign PDCCH configuration to the downlink

% Configure DMRS (Demodulation Reference Signal) for PDSCH
pdschDMRS1 = nrPDSCHDMRSConfig( ...
    'DMRSConfigurationType', 1, ... % Type of DMRS configuration
    'DMRSReferencePoint', 'CRB0', ... % Reference point for DMRS
    'NumCDMGroupsWithoutData', 2, ... % Number of CDM groups without data
    'DMRSTypeAPosition', 2, ... % Type A DMRS position
    'DMRSAdditionalPosition', 0, ... % Additional DMRS positions
    'DMRSLength', 1, ... % Length of DMRS
    'CustomSymbolSet', [], ... % Custom symbol set (default)
    'DMRSPortSet', [], ... % DMRS port set (default)
    'NIDNSCID', [], ... % Scrambling ID (default)
    'NSCID', 0); % Scrambling sequence ID

% Configure PTRS (Phase Tracking Reference Signal) for PDSCH
pdschPTRS1 = nrPDSCHPTRSConfig( ...
    'TimeDensity', 1, ... % Time density of PTRS
    'FrequencyDensity', 2, ... % Frequency density of PTRS
    'REOffset', '00', ... % PTRS RE offset
    'PTRSPortSet', []); % PTRS port set (default)

% Configure Reserved PRB for PDSCH
pdschReserved1 = nrPDSCHReservedConfig( ...
    'PRBSet', [], ... % Reserved PRBs (default)
    'SymbolSet', [], ... % Reserved symbols (default)
    'Period', []); % Periodicity (default)

% Loop to generate PDSCH configurations for multiple scenarios
for s = 2:2:16
    ind = 0:8:128; % Define possible RB group indices
    slot_N = 10; % Number of slots to allocate
    slot_idx = randperm(10,slot_N)-1; % Randomly allocate slots
    mod_opt = ["QPSK","16QAM","64QAM"]; % Modulation options
    for i = 1:1
        RBG_n = s; % Number of RB groups
        R = randperm(16,RBG_n); % Randomly select RB groups
        RBG_s= sort(ind(R)); % Sort the selected RB groups
        RB_i = zeros(RBG_n*8,1); % Initialize RB indices array
        for r = 1:RBG_n
            j =  r*8; % Calculate RB index
            RB_s = RBG_s(r); % Start of the RB group
            RB_i(j)= RB_s+7; % Populate RB indices for the group
            RB_i(j-1)= RB_s+6;
            RB_i(j-2)= RB_s+5;
            RB_i(j-3)= RB_s+4;
            RB_i(j-4)= RB_s+3;
            RB_i(j-5)= RB_s+2;
            RB_i(j-6) = RB_s+1;
            RB_i(j-7)=RB_s; 
        end

        for P = -20:10:20
            for m = 1:3

                mod = mod_opt(m); % Select modulation scheme

                % Configure PDSCH
                pdsch1 = nrWavegenPDSCHConfig( ...
                    'Enable', true, ... % Enable PDSCH
                    'Label', 'PDSCH1', ... % Label for PDSCH
                    'Power',P, ... % Transmission power
                    'BandwidthPartID', 1, ... % Associated BWP ID
                    'Modulation', mod, ... % Modulation type
                    'NumLayers', 1, ... % Number of transmission layers
                    'MappingType', 'A', ... % Mapping type
                    'ReservedCORESET', [], ... % Reserved CORESET (default)
                    'SymbolAllocation', [0 14], ... % Symbol allocation
                    'SlotAllocation',slot_idx, ... % Slot allocation
                    'Period', 10, ... % Periodicity
                    'PRBSet', RB_i, ... % PRB allocation
                    'VRBToPRBInterleaving', false, ... % Disable interleaving
                    'VRBBundleSize', 2, ... % VRB bundle size
                    'NID', 1, ... % Scrambling ID
                    'RNTI', 1, ... % RNTI
                    'Coding', true, ... % Enable coding
                    'TargetCodeRate', 0.513671875, ... % Target code rate
                    'TBScaling', 1, ... % Transport block scaling
                    'XOverhead', 0, ... % Overhead
                    'RVSequence', [0 2 3 1], ... % Redundancy version sequence
                    'DataSource', 'PN9-ITU', ... % Data source
                    'DMRSPower', 0, ... % DMRS power
                    'EnablePTRS', false, ... % Disable PTRS
                    'PTRSPower', 0); % PTRS power
                pdsch1.ReservedPRB{1} = pdschReserved1; % Assign reserved PRB
                pdsch1.DMRS = pdschDMRS1; % Assign DMRS configuration
                pdsch1.PTRS = pdschPTRS1; % Assign PTRS configuration
                cfgDL.PDSCH  = {pdsch1}; % Assign PDSCH configuration to the downlink

                % Configure CSI-RS (Channel State Information Reference Signal)
                csirs1 = nrWavegenCSIRSConfig( ...
                    'Enable', false, ... % Disable CSI-RS
                    'Label', 'CSIRS1', ... % Label for CSI-RS
                    'Power', -1, ... % Power of CSI-RS
                    'BandwidthPartID', 1, ... % Associated BWP ID
                    'CSIRSType', 'nzp', ... % Type of CSI-RS
                    'CSIRSPeriod', 'on', ... % Periodicity of CSI-RS
                    'RowNumber', 3, ... % Row number of CSI-RS
                    'Density', 'one', ... % Density of CSI-RS
                    'SymbolLocations', 0, ... % Symbol locations
                    'SubcarrierLocations', 0, ... % Subcarrier locations
                    'NumRB', 30, ... % Number of resource blocks
                    'NID', 0); % Scrambling ID
                cfgDL.CSIRS  = {csirs1}; % Assign CSI-RS configuration

                % Record waveform information
                wave_info.RBG_idx = sort(R); % Resource block group indices
                wave_info.slot_idx = [0:10]; % Slot indices
                wave_info.power = -30+P; % Power level
                wave_info.mod = mod; % Modulation type

                % Generate waveform
                [waveform,info] = nrWaveformGenerator(cfgDL); % Generate the waveform

                % Save waveform and information
                fname = sprintf('samplewave_%d_%d_%d_%s.mat',s,i,P,mod); % Filename for waveform
                fname_dat = sprintf('sample_%d_%d_%d_%s.dat',s,i,P,mod); % Filename for binary data
                save(fname,"waveform") % Save waveform as .mat file
                fname_info = sprintf('sampleinfo_%d_%d_%d_%s.mat',s,i,P,mod); % Filename for info
                save(fname_info,"wave_info") % Save waveform info

                % Visualization of waveform spectrum
                Fs = info.ResourceGrids.Info.SampleRate; % Sample rate of waveform
                nfft = info.ResourceGrids.Info.Nfft; % FFT size
                figure;
                spectrogram(waveform(:,1),ones(nfft,1),0,nfft,'centered',Fs,'yaxis','MinThreshold',-130); % Plot spectrogram
                title('Spectrogram of 5G Downlink Baseband Waveform'); % Title for the plot

                % Write binary data to file
                write_complex_binary(waveform,fname_dat); % Save waveform in binary format
            end 
        end
    end
end
