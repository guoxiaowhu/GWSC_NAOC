function strain = Strain_Tensor(h_p,h_c,theta,phi,psi)
%strain in detector local frame (arms at 90 degrees)
%[Fp,Fc]=DETFRAMEFPFC(T,P)
%Returns the antenna pattern function values Fp, Fc (corresponding to F_+
%and F_x respectively) for a given sky location in the local frame of a 
%90 degree equal arm length interferometer. The X and Y axes of the frame
%point along the arms. T is the polar angle (0 radians on the Z axis) and P
%is the azimuthal angle (0 radians on the X axis). T and P can be vectors
%(equal lengths), in which case Fp and Fc are also vectors with Fp(i) and
%Fc(i) corresponding to T(i) and P(i).

%Number of locations requested
nLocs = length(theta);
if length(phi) ~= nLocs
    error('Number of theta and phi values must be the same');
end

%Obtain the components of the unit vector pointing to the source location
sinTheta = sin(theta(:));
vec2Src = [sinTheta.*cos(phi(:)),...
           sinTheta.*sin(phi(:)),...
           cos(theta(:))];
       
%Get the wave frame vector components (for multiple sky locations if needed)
xVec = vcrossprod(repmat([0,0,1],nLocs,1),vec2Src);
yVec = vcrossprod(xVec,vec2Src);
%Normalize wave frame vectors
for lpl = 1:nLocs
    xVec(lpl,:) = xVec(lpl,:)/norm(xVec(lpl,:));
    yVec(lpl,:) = yVec(lpl,:)/norm(yVec(lpl,:));
end

%Detector tensor of a perpendicular arm interferometer 
detTensor = 0.5*([1,0,0]'*[1,0,0]-[0,1,0]'*[0,1,0]);

Rot_psi = [cos(2*psi),sin(2*psi);-sin(2*psi),cos(2*psi)];
strain = zeros(1,nLocs);
%For each location ...
for i = 1:length(h_p)
    for lpl = 1:nLocs
        %Wave tensor contraction with detector tensor
        ePlus = xVec(lpl,:)'*xVec(lpl,:)-yVec(lpl,:)'*yVec(lpl,:);
        eCross = xVec(lpl,:)'*yVec(lpl,:)+yVec(lpl,:)'*xVec(lpl,:);
        for j= 1:3
            for k =1:3
                eNew =[ePlus(j,k),eCross(j,k)]*Rot_psi; 
                ePlus(j,k) = eNew(1);
                eCross(j,k)= eNew(2);
            end
        end    
        waveTensor= h_p(i)*ePlus + h_c(i)*eCross;
        strain(i,lpl) = sum(waveTensor(:).*detTensor(:));
    end
   
end


end