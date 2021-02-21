function sigVec = crcbgenSinsig(dataX,snr,f_0,phi_0)
% Generate a sinusoidal signal
% S = crcbgenSinsig(X,SNR,f_0,phi_0)
% Generates a quadratic chirp signal S. X is the vector of
% time stamps at which the samples of the signal are to be computed. SNR is
% the matched filtering signal-to-noise ratio of S and f_0 is the frequency
% phi_0 is the intial phase.

%Xiao Guo Feb. 2021

phaseVec = 2*pi* f_0*dataX + phi_0;
sigVec = sin(phaseVec);
sigVec = snr*sigVec/norm(sigVec);




