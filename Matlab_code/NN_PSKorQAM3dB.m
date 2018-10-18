function [y1] = NN_PSKorQAM3dB(x1)
% This neural network is trained at 3dB to detect the modulation type PSK
% or QAM


% Generated by Neural Network Toolbox function genFunction, 30-Nov-2016 00:15:45.
%
% [y1] = myNeuralNetworkFunction(x1) takes these arguments:
%   x = 13xQ matrix, input #1
% and returns:
%   y = 2xQ matrix, output #1
% where Q is the number of samples.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1_xoffset = [-1.80452888393132;-4.14571262328729;1.54824888260268;-2.43610736280019;-2.38047149505202;-1.30422991522891;-83.2905106474218;-47.2837008065074;2.48333642947635;-80.7446370264233;-11.59768662627;-102.669263772788;-6.26673622713588];
x1_step1_gain = [0.571219703671532;0.11878390022566;0.0196432140833526;0.549008355534478;0.600276734480076;0.0196659606392836;0.0160392873488553;0.0240721618549836;0.00090561910748638;0.0162450776430361;0.013655261316142;0.0045698481958938;0.0714564545081144];
x1_step1_ymin = -1;

% Layer 1
b1 = [-1.5308111169875041;-1.1870346880782521;0.16574765002043618;0.18882480610329433;0.96709577956899095;1.5969467549397558];
IW1_1 = [0.58050292955946858 0.010201531954952492 0.12978426951267347 -0.28164006920880147 -0.82821087274723915 0.51118881968251728 -0.8016055859992034 -0.66567410437462082 0.042709202787760268 0.27704461283015297 0.15865256366139496 0.16411670989120039 -0.116482071701066;2.0604231658680745 -2.0810667761664221 -0.19809431194368635 -0.26938762191715104 1.9017696904221708 -0.24118928649496163 -0.7286366269664295 0.5615856851339156 -0.60558934376106976 0.80442553491333535 1.3862999478483937 -0.67800679359943772 5.096621924870762;0.83067900775872328 -2.3768925080544601 -0.16282529768971721 -0.5740416178442751 2.0136075910885136 0.62280273047267332 -0.041575419036113212 -0.064956129255971912 -0.25885124839726587 0.47584986640718785 0.8403383756223648 -1.1450285605699555 4.638006368179985;0.37215870758581487 1.0003316403741835 -0.71659250337741276 -0.61888025673105318 -1.962404937441691 0.028980555736571309 0.78007490623266684 0.5435713691296804 -0.0090874020601874952 0.24030238277682509 -0.62892411927686664 0.14686488651888557 -0.97957642402578726;0.11615024686847414 -0.17906148490148582 0.71832869024653723 -0.16888432721276359 0.37077383342635373 -0.53806182110729839 0.2148975208887085 -0.57287860429623072 -0.77645085081244525 0.69570695248934544 -0.2935400057189228 -0.10530407321161971 0.07182121331659265;0.17228526300909158 0.08772495954838079 -0.50788325806218382 0.56028158551044682 0.72199263318897688 0.11112536915425139 -0.65697497140323535 0.43814059476137018 -0.41254501585480957 0.23978215929266208 -0.27010314008945469 0.13384226831310392 0.63420604935246183];

% Layer 2
b2 = [0.60753873646800527;-0.24290682570086958];
LW2_1 = [0.38948725003206036 4.2373977654893622 3.729551595400852 -1.4445100108616655 -0.044058260467288952 -0.39884548301068196;0.039239054088269915 -3.2867681722425885 -3.6837093688970879 2.0274069109958801 0.28595445479825909 -0.67085191760281837];

% ===== SIMULATION ========

% Dimensions
Q = size(x1,2); % samples

% Input 1
xp1 = mapminmax_apply(x1,x1_step1_gain,x1_step1_xoffset,x1_step1_ymin);

% Layer 1
a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*xp1);

% Layer 2
a2 = softmax_apply(repmat(b2,1,Q) + LW2_1*a1);

% Output 1
y1 = a2;
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings_gain,settings_xoffset,settings_ymin)
y = bsxfun(@minus,x,settings_xoffset);
y = bsxfun(@times,y,settings_gain);
y = bsxfun(@plus,y,settings_ymin);
end

% Competitive Soft Transfer Function
function a = softmax_apply(n)
nmax = max(n,[],1);
n = bsxfun(@minus,n,nmax);
numer = exp(n);
denom = sum(numer,1);
denom(denom == 0) = 1;
a = bsxfun(@rdivide,numer,denom);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n)
a = 2 ./ (1 + exp(-2*n)) - 1;
end