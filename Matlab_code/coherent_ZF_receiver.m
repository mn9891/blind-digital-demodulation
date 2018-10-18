function [separated_data]=coherent_ZF_receiver(received_signal,H)
% This function is used for equalization using zero forcing algorithm

rate=1;
nb_emitters=2;
code_length=2;
nb_symbols_block=code_length*rate;

% Extract coding matrices
G=zeros(2*nb_emitters*code_length,2*nb_symbols_block);
for indice=1:nb_symbols_block
    real_part=zeros(1,nb_symbols_block);
    real_part(indice)=1;
    imag_part=zeros(1,nb_symbols_block);
    imag_part(indice)=1i; 
    Ak=alamoutiSpaceTimeCoding(real_part)';  
    Bk=alamoutiSpaceTimeCoding(imag_part)';   
    Akt=Ak(:);
    Bkt=Bk(:);
    G(:,indice)=[real(Akt);imag(Akt)];                      %for real part
    G(:,indice+nb_symbols_block)=[real(Bkt);imag(Bkt)];     %for imag part
end


% rewritting the received symbol into a vector form
[nb_receiver,N]	= size(received_signal); 
Nb_bloc=N/code_length;
for indice=1:Nb_bloc
    Xv=received_signal(:,(indice-1)*code_length+1:indice*code_length)';
    xv_tilde(:,indice)=[real(Xv(:));imag(Xv(:))];    
end    

W_tilde=[kron(real(H),eye(code_length)) kron(imag(H),eye(code_length));...
            -kron(imag(H),eye(code_length)) kron(real(H),eye(code_length))]; 
    
% Zero forcing receiver
separated_data=[eye(nb_symbols_block) 1i*eye(nb_symbols_block)]*pinv(W_tilde*G)*xv_tilde;


