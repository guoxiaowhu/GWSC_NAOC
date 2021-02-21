function sigVec = crcbgenAMFMsig(dataX,snr,b,f_0,f_1)
% Generate a AM-FM signal
% S = crcbgenAMFMsig(X,SNR,f_0,phi_0)
% 
% s(t)= A*cos(2*pi*f_1*t) * sin(2*pi*f_0*t + b*cos(2*pi*f_1*t))

%Xiao Guo Feb. 2021

AphaVec = 2*pi* f_1*dataX;
AmpVec = cos(AphaVec);
phaseVec = 2*pi* f_0*dataX + b*AmpVec;
sigVec = sin(phaseVec);

sigVec = snr* AmpVec *sigVec/norm(sigVec);