function sigVec = crcbgenEDSsig(tVec,snr,t_a,f_0,tau,phi_0,L)
% Generate a exponentially damped sinusoidal signal
% When t_a<t<t_a+L, s(t)=A*exp(-(t-t_a)/tau)* sin(2*pi*f_0*t +phi_0)

%Xiao Guo Feb. 2021

Delt = tVec-t_a;
phaseVec = 2*pi*f_0* tVec  + phi_0;
sigVec = sin(phaseVec);
ExpVec = exp(-Delt/tau);
cond = (t_a<=tVec) & (tVec<=t_a+L);


sigVec(cond) = snr* ExpVec(cond).*sigVec(cond)/norm(sigVec(cond));
sigVec(~cond) =0*sigVec(~cond);
