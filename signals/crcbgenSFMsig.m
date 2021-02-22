function sigVec = crcbgenSFMsig(t,snr,t_a,f_0,f_1)
% Generate a step FM signal
% When t<=t_a, s(t)=A*sin(2*pi*f_0*t);
% When t>t_a, s(t)=A*sin(2*pi*f_1*(t-t_a)+2*pi*f_0*t_a)

%Xiao Guo Feb. 2021

phaseVec1 = 2*pi*f_0*t;
phaseVec2 = 2*pi*f_1*(t-t_a)+2*pi*f_0*t_a;

sigVec1 = sin(phaseVec1);
sigVec2 = sin(phaseVec2);
cond = t<=t_a;

sigVec(cond) = snr*sigVec1(cond)/norm(sigVec1(cond));
sigVec(~cond) = snr*sigVec2(~cond)/norm(sigVec2(~cond));

