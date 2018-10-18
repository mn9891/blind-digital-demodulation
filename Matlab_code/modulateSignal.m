function modulated_signal=modulateSignal(signal,modulation_type,M)
%This function modulates the signal using M-th order PSK or QAM modulation  

switch modulation_type
    case 'PSK'
        modulator=modem.pskmod(M); % Generate the modulator.
        constellation = pskmod(0:M-1,M); % Generate the constellation.
    case 'QAM'
        modulator=modem.qammod(M); % Generate the modulator.
        constellation = qammod(0:M-1,M); % Generate the constellation.
end
scale = modnorm(constellation,'avpow',1); % Compute scale factor to have unit energy.
modulated_signal = scale * modulate(modulator,signal);