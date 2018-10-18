function [input_matrix,target_matrix]=trainingMatricesGeneration(snr)
%Generate input and target matrices for the neural network training
tic
% snr=-3;
N=1000;
input_matrix=zeros(13,6*N);
target_matrix=zeros(6,6*N);
mod_vec={'PSK';'PSK';'PSK';'QAM';'QAM';'QAM'};
ord_vec=[2,4,8,8,16,64];
for j=1:length(mod_vec)
    parfor i=N*(j-1)+1:N+N*(j-1)
%         snr=-5+25*rand;
        r=receivedEqualizedModulatedSignal(char(mod_vec(j)),ord_vec(j),snr);
        input_matrix(:,i)=featuresComputationModulatedSignal(r);
        target_matrix(j,i)=1;
    end
end
toc
%%%%

end

