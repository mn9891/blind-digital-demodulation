function [equalized_symbols] = receivedEqualizedModulatedSignal(modulation_type, M, snr)

% This function provides a received Equalized Modulated Signal given a
% modulation type and order and SNR

N=10*1024;                  %Number of symbols to be transmitted
nb_receivers=2;          %2 receivers
nb_emitters=2;           %2 emitters

% Generate a symbol sequence randomly. The symbols belong to the set of integer: [0 M-1]
signal=randi(M-1,1,N);
  
% Modulate the signal
modulated_signal= modulateSignal(signal,modulation_type,M);

 
% perform space time encoding
[STBC_blocs]=alamoutiSpaceTimeCoding(modulated_signal);
 
% Create a random channel matrix
channel_matrix=sqrt(0.5)*(randn(nb_receivers,nb_emitters)+1i*randn(nb_receivers,nb_emitters));
received_signal=channel_matrix*STBC_blocs;
 
% Apply AWGN noise
 
noise_variance=1/(10^(snr/10));
noise=(sqrt(noise_variance/2))*(randn(nb_receivers,size(STBC_blocs,2))+...
                                1i*randn(nb_receivers,size(STBC_blocs,2)));                          
received_signal=received_signal+noise;
 

 
% switch modulation_type
%     case 'PSK'
%         modulator=modem.pskmod(M);
%     case 'QAM'
%         modulator=modem.qammod(M);
% end       

% Perform Space time block equalization
equalized_symbols=coherent_ZF_receiver(received_signal,channel_matrix);
equalized_symbols=equalized_symbols(:).'; %convert matrix -> row vector

