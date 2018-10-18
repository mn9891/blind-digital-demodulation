function features_vector= featuresComputationModulatedSignal(modulated_signal)
% Computation of higher order statistics (our ANN features) for a given
% modulated_signal in input

y=modulated_signal;
%-------------------------------------------------------
C20 = real(mean(y.^2));
C21 = real(mean(abs(y).^2));
%-------------------------------------------------------
M40 = real(mean(y.^4));
M41 = real(mean(y.^3 .* conj(y)));
M42 = real(mean(y.^2 .* conj(y).^2));
C40 = real(mean(y.^4)-3*(C20.^2));
C41 = real(mean((y.^3).* conj(y))- 3*C20*C21);
C42 = real(mean(abs(y).^4)-abs(C20).^2 -2*(C21^.2) );
%-------------------------------------------------------
M60 = real(mean(y.^6));
M61 = real(mean(y.^5 .* conj(y)));
M62 = real(mean(y.^4 .* (conj(y).^2) ));
M63 = real(mean(y.^3 .* conj(y).^3));
C60 = real(mean(y.^6)- 15*mean(y.^4).*mean(y.^2)+30.*(mean(y.^2)^3));
C61 = real(mean((y.^5).*conj(y))- 5.*mean(y.^4)*mean(y.*conj(y))- 10.*mean(y.^2).*mean((y.^3).*y)+ 30.*mean(y.*conj(y))*(mean(y.^2)^2));
C62 = real(mean((y.^4).*(conj(y).^2))- mean(y.^4).*mean(conj(y).^2)-8*mean(y.*conj(y))*mean((y.^3).*conj(y))-6.*mean(conj(y).^2).*(mean(y.^2)^2)+24*mean(y.^2).*(mean(y.*conj(y))^2)) ;
C63 = real(mean((y.^3).*(conj(y).^3))- 6*mean(y.^2).* mean(y.*(conj(y).^3))- 9.*mean(y.*conj(y)).*mean((y.^2).*(conj(y).^2))+ 18.*mean(y.^2).*mean(conj(y).^2)*mean(y.*conj(y))+ 12.*(mean(y.*conj(y)).^3));
%-------------------------------------------------------

features_vector= [M40 M41 M42 C40 C41 C42 M60 M61 M63 C60 C61 C62 C63]';