function sigVec = crcbgenAMsig(dataX,snr,f_0,f_1,phi_0)
% Generate a AM signal
% S = crcbgenAMsig(X,SNR,f_0,phi_0)
% 
% s(t)= A*cos(2*pi*f_1*t) * sin(2*pi*f_0*t+phi_0)

%Xiao Guo Feb. 2021

phaseVec = 2*pi* f_0*dataX+phi_0;
AphaVec = 2*pi* f_1*dataX;

sigVec = sin(phaseVec);
AmpVec = cos(AphaVec);
sigVec = snr* AmpVec .*sigVec/norm(sigVec);
