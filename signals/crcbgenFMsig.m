function sigVec = crcbgenFMsig(dataX,snr,b,f_0,f_1)
% Generate a FM signal
% S = crcbgenFMsig(X,SNR,b,f_0,f_1)
% 
% s(t)= A*sin(2*pi*f_0*t + b* cos(2*pi*))

%Xiao Guo Feb. 2021

phaseVec = 2*pi* f_0*dataX + b*cos(2*pi*f_1*dataX);
sigVec = sin(phaseVec);
sigVec = snr*sigVec/norm(sigVec);
