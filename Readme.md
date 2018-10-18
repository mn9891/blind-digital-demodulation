
# Blind Digital Modulation Identification Using Neural Networks and Higher Order Statistics


### Final Project - Artificial Intelligence course (ECSE 526) - McGill - Fall 2016

Please refer to the [report](Report.pdf) and [presentation](Presentation.pdf) for further details about the system model, configuration and results.

## Instructions
In the [Matlab code](Matlab_code) folder, you should be able to find several functions to perform different tasks of communication system and performance evaluation.
Each function has been named in such a way it provides a clear idea about what it performs and a comment on its beginning details it.

Neural networks created are named NNxxx.m where xxx varied depending on the SNR training level and task it performs.
For example to test the NN trained at 15dB you could do the following:
- Generate and modulate a signal using modulateSignal.m
- Perform space time coding: alamoutiSpaceTimeCoding.m
- Send it through the channel to get the received noisy modulated sgnal received: receivedEqualizedModulatedSignal.m
- Equalize the received signal zer forcing: coherent_ZF_receiver.m
- Compute the features: featuresComputationModulatedSignal.m
- Pass them to the neural network NN15dB and you get a vector of length 6. 
Optimally, the output would be a vector containing one and 5 zeros to indicate the chosen class but, practically, when the neural network _is not entirely sure_, it can provide probabilities (numbers between 0 and 1) and the decision is made according to the highest value. 

Result vector is as follows: [2-PSK,4-PSK,8-PSK,8-QAM,16-QAM,64-QAM]
meaning that if you get [0,1,0,0,0,0], the moduation used is 4-PSK and if you get [0,0,0,0,0.98,0.02], the modulation used is probablly 16-QAM at 98% and the vote goes for it.

The 5 first steps could be done directly the the function featuresNoisyModulatedSignal.m, you pass them to the neural network and get the result.
Example of execution:

>> V=featuresNoisyModulatedSignal('PSK',8,10);
>> NN15dB(V)

ans =

    0.0000
    0.0002
    0.9998
    0.0000
    0.0000
    0.0000

This means the neural network trained at 15dB noise is certain at 99.98% that this signal at 10 dB SNR is modulated using 8-PSK




