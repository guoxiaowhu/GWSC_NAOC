function sigVec = crcbgenSFMsig(t,snr,t_a,f_0,f_1)
% Generate a step FM signal
% When t<=t_a, s(t)=A*sin(2*pi*f_0*t);
% When t>t_a, s(t)=A*sin(2*pi*f_1*(t-t_a)+2*pi*f_0*t_a)

%Xiao Guo Feb. 2021

phaseVec1 = 2*pi*f_0*t;
phaseVec2 = 2*pi*f_1*(t-t_a)+2*pi*f_0*t_a;

sigVec1 = sin(phaseVec1);
sigVec2 = sin(phaseVec2);
dataX<=t_a; sigVec = snr*sigVec1/norm(sigVec1);
data>t_a;sigVec = snr*sigVec2/norm(sigVec2);
