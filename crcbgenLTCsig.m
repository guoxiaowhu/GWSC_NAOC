function sigVec = crcbgenLTCsig(tVec,snr,t_a,f_0,f_1,phi_0,L)
% Generate a linear transient chirp signal
% When t_a<t<t_a+L, s(t)=A*sin(2*pi*(f_0*(t-t_a)+f_1*(t-t_a)^2) +phi_0)

%Xiao Guo Feb. 2021

Delt = tVec-t_a;
phaseVec = 2*pi*(f_0*Delt + f_1* Delt.^2) + phi_0;
sigVec = sin(phaseVec);

cond = (t_a<=tVec) & (tVec<=t_a+L);


sigVec(cond) = snr*sigVec(cond)/norm(sigVec(cond));
sigVec(~cond) =0*sigVec(~cond);
