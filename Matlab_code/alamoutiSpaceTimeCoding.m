function [modulated_coded_symbols]=alamoutiSpaceTimeCoding(modulated_symbols)
% This function computes the space time code (using alamouti code for 2*2 antennas) 

if(mod(length(modulated_symbols),2)~=0) 
    modulated_symbols(end+1:end+(2-mod(length(modulated_symbols),2)))=0;
end  
modulated_coded_symbols=[];        
symboles_reshape=reshape(modulated_symbols,2,length(modulated_symbols)/2);
x1=[1 0];
x2=[0 1];
P1=[x1;x2];
P2=[-x2;x1];
P= [P1;conj(P2)];
modulated_coded_symbols=P*symboles_reshape;
modulated_coded_symbols(3:4,:)=conj(modulated_coded_symbols(3:4,:));
modulated_coded_symbols=reshape(modulated_coded_symbols,2,numel(modulated_coded_symbols)/2);
end    
