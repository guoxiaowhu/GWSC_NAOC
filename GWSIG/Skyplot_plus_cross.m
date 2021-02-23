%% Skyplot for F_plus and F_cross

%Xiao Guo Feb. 2021

%F_plus = 1/2*(1+cos^2(theta))*cos(2*phi)
%F_cross = cos(theta)*sin(2*phi)

%Azimuthal angle
phiVec = 0:0.01:(2*pi);
%Polar angle
thetaVec = 0:0.01:pi;

%Function handle: F+ from formula
fp = @(x,y) formulafp(x,y);
figure;
skyplot(phiVec,thetaVec,fp);
axis equal;

fc = @(x,y) formulafc(x,y);
figure;
skyplot(phiVec,thetaVec,fc);
axis equal;

function fplus = formulafp(phi,theta)
%F_+ for 90 degree arm interferometer in detector frame
%Fp = FORMULAFP(P,T)
%Calculate the F_+ antenna pattern function of an interferometer with
%perpendicular arms using source direction specified in the detectors local
%frame in which the X and Y axes are oriented along the arms of the
%detector. T and P are scalars containing values of the polar and azimuthal
%angles, respectively, in radians. The calculation of the antenna pattern
%uses the analytical formula.

fplus = 0.5*(1+cos(theta)^2)*cos(2*phi);
end

function fcross = formulafc(phi,theta)
%F_+ for 90 degree arm interferometer in detector frame
%Fp = FORMULAFP(P,T)
%Calculate the F_+ antenna pattern function of an interferometer with
%perpendicular arms using source direction specified in the detectors local
%frame in which the X and Y axes are oriented along the arms of the
%detector. T and P are scalars containing values of the polar and azimuthal
%angles, respectively, in radians. The calculation of the antenna pattern
%uses the analytical formula.

fcross = cos(theta)*sin(2*phi);
end