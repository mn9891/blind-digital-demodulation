function n = testPerformCascade(k,mod_type,M,snr)
% tester les performance
%k est le nombre de tests
n=0;
switch mod_type
    case 'PSK'
        switch M
             case 2
                 i=1;
             case 4
                 i=2;
            otherwise
               i=3;
        end


case 'QAM'
    switch M
        case 8
            i=1;
        case 16
            i=2;
        otherwise
            i=3;
    end
end
    
for j=1:k
    [Y] = NNcascade(featuresComputationModulatedSignal(receivedEqualizedModulatedSignal(mod_type, M, snr)));
    if find(Y==max(Y))==i
        n=n+1;
    end
end

n= n/k *100;
%disp(['Le pourcentage de réussite d"identification des ',num2str(M),'-',mod_type,' est ',num2str(n),'%']);
        
    

end

