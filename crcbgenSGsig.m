function sigVec = crcbgenSGsig(dataX,snr,t_0,sigma,f_0,phi_0)
% Generate a Sine-Gaussian signal
% S = crcbgenSinsig(X,SNR,t_0,sigma,f_0,phi_0)
% Generates a quadratic chirp signal S. X is the vector of
% time stamps at which the samples of the signal are to be computed. SNR is
% the matched filtering signal-to-noise ratio of S and f_0 is the frequency
% phi_0 is the intial phase.


phaseVec = 2*pi* f_0*dataX + phi_0;
sigVec = sin(phaseVec);
norTim = (dataX-t_0)^2/(2*sigma^2);
ExpVec = exp(-norTim);
sigVec = snr*sigVec/norm(sigVec)*ExpVec;
