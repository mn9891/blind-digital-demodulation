function [features_vector]=featuresNoisyModulatedSignal(modulation_type,M,snr)
% This function generates a random sifnal, modulates it according to the
% input and computes its features

%snr=10;         %Signal to noise ration in db
Nsample =  1024; % Signal's binary sequence length
signal = randi([0 M-1],1,Nsample);  % Generation of symbol sequence, signal 
modulated_signal=modulateSignal(signal,modulation_type,M);
noisy_modulated_signal = step(comm.AWGNChannel('NoiseMethod',...
    'Signal to noise ratio (SNR)','SNR',snr), modulated_signal); % Apply AWGN noise 
features_vector= featuresComputationModulatedSignal(noisy_modulated_signal); 