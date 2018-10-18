function result=NNcascade(features)
% This function uses the the layer of neural networks, type and order
% detectors to delever the decision reltive to the modulation scheme

aux=NN_PSKorQAM3dB(features);
indice=find(aux==max(aux));
if indice==1
    result=NN_PSK_3dB(features);
else
    result=NN_QAM_3dB(features);
end