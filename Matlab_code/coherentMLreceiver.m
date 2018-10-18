function [separated_data]=coherentMLreceiver(received_signal,H,modulator)

rate=1;
code_length=2;
nb_symbols_block=code_length*rate;

% Construction of the Block Alphabet
alphabet=modulate(modulator,[0:(modulator.M)-1]);

% construct all the symbol combinations
for indice=nb_symbols_block:-1:1
    tmp=repmat(alphabet,length(alphabet)^(nb_symbols_block-indice),length(alphabet)^(indice-1));
    MIMO_alphabet(indice,:)=tmp(:).';
end    
nb_combination=size(MIMO_alphabet,2);
% construct all the block combination
for indice=1:nb_combination
   MIMO_alphabet_temp=MIMO_alphabet(:,indice);
   C(indice,:,:)=alamoutiSpaceTimeCoding(MIMO_alphabet_temp);    
end    

% ML Decoding
%  this receiver is computationnaly expensive for high order modulation and
%  for a large number of symbol per block 

[nb_receiver,N]	= size(received_signal); 
Nb_bloc=N/code_length;
for indice=1:Nb_bloc
    %extrcat one STBC block
    Xv=received_signal(:,(indice-1)*code_length+1:indice*code_length);
    %Minimize the ML metric
    for num_combination=1:nb_combination
        if code_length==1
            C_temp(:,:)=C(num_combination,:).';  %case of spatial multiplexing
        else    
            C_temp(:,:)=C(num_combination,:,:);
        end
        error(num_combination)=norm(Xv-H*C_temp,'fro');
    end
    [mininum_error,index_min]=min(error);
    %keep the best symbol combination
    separated_data(:,indice)=MIMO_alphabet(:,index_min);
end    


