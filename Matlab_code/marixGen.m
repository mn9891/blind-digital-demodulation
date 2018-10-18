% I used this script to generate training  matrices for different
% modulation schemes for the whole range of SNR 

snr=-12:3:30;
[input_matrix_30]=trainingMatricesGeneration2(30);
[input_matrix_29]=trainingMatricesGeneration2(27);
[input_matrix_24]=trainingMatricesGeneration2(24);
[input_matrix_21]=trainingMatricesGeneration2(21);
tic
[input_matrix_18]=trainingMatricesGeneration2(18);
toc
[input_matrix_15]=trainingMatricesGeneration2(15);
toc
[input_matrix_12]=trainingMatricesGeneration2(12);
toc
[input_matrix_9]=trainingMatricesGeneration2(9);
toc
[input_matrix_6]=trainingMatricesGeneration2(6);
toc
[input_matrix_3]=trainingMatricesGeneration2(3);
toc
[input_matrix_0]=trainingMatricesGeneration2(0);
toc
[input_matrix_n3]=trainingMatricesGeneration2(-3);
toc
[input_matrix_n6]=trainingMatricesGeneration2(-6);
toc
[input_matrix_n9]=trainingMatricesGeneration2(-9);
toc
[input_matrix_n12,target_matrix8]=trainingMatricesGeneration2(-12);
toc