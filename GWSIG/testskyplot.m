%% Test harness for FORMULAFP and SKYPLOT
%Azimuthal angle
phiVec = 0:0.01:(2*pi);
%Polar angle
thetaVec = 0:0.01:pi;

%Function handle: F+ from formula
fp = @(x,y) formulafp(x,y);

skyplot(phiVec,thetaVec,fp);
axis equal;
