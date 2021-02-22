function sigVec = crcbgenSGsig(dataX,snr,t_0,sigma,f_0,phi_0)
% Generate a Sine-Gaussian signal
% S = crcbgenSGsig(X,SNR,t_0,sigma,f_0,phi_0)
% 
%Xiao Guo Feb. 2021

phaseVec = 2*pi* f_0*dataX + phi_0;
sigVec = sin(phaseVec);
norTim = (dataX-t_0)^2/(2*sigma^2);
ExpVec = exp(-norTim);
sigVec = snr*sigVec/norm(sigVec).*ExpVec;
