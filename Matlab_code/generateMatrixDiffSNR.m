function y = generateMatrixDiffSNR(modulation_type,M)
%This function generates an input tarining matrix for a specific modulation scheme for the
%whole range of SNR
N=1000;
y=zeros(15,N);
i=0;
for snr=-12:3:30
    i=i+1;
    for j=1:N
        y(i,j)=featuresNoisyModulatedSignal(modulation_type,M,snr);
    end
end
