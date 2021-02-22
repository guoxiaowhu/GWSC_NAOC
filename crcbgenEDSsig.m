function sigVec = crcbgenEDSsig(dataX,snr,t_a,f_0,tau,phi_0,L)
% Generate a exponentially damped sinusoidal signal
% When t_a<t<t_a+L, s(t)=A*exp(-(t-t_a)/tau)* sin(2*pi*f_0*t +phi_0)

%Xiao Guo Feb. 2021

Delt = dataX-t_a;
phaseVec = 2*pi*f_0* dataX  + phi_0;
sigVec = sin(phaseVec);
ExpVec = exp(-Delt/tau);
t_a<=dataX<=t_a+L; sigVec = snr* ExpVec.*sigVec/norm(sigVec);
(data<t_a)|(data> t_a+L);sigVec =0;
