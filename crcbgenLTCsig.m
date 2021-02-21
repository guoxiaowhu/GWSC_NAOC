function sigVec = crcbgenLTCsig(dataX,snr,t_a,f_0,f_1,phi_0,L)
% Generate a linear transient chirp signal
% When t_a<t<t_a+L, s(t)=A*sin(2*pi*(f_0*(t-t_a)+f_1*(t-t_a)^2) +phi_0)

%Xiao Guo Feb. 2021

Delt = dataX-t_a;
phaseVec = 2*pi*(f_0*Delt + f_1* Delt^2) + phi_0;
sigVec = sin(phaseVec);
t_a<=dataX<=(t_a+L); sigVec = snr*sigVec/norm(sigVec);
(data<t_a)|(data> t_a+L);sigVec =0;
