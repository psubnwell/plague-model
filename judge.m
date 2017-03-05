function [pa,pb,pc]=judge()
global S I R cai caj cbi cbj cci ccj goBadRate;

maxInfection=max(max(I));
[i j]=find(I==maxInfection);
distanceToA=sqrt((i-cai)^2+(j-caj)^2);
distanceToB=sqrt((i-cbi)^2+(j-cbj)^2);
distanceToC=sqrt((i-cci)^2+(j-ccj)^2);
dAB=sqrt((cai-cbi)^2+(caj-cbj)^2);
dAC=sqrt((cai-cci)^2+(caj-ccj)^2);
dBC=sqrt((cbi-cci)^2+(cbj-ccj)^2);

if(distanceToA<distanceToB)&&(distanceToA<distanceToC)
    % A is the nearest
    pa=1;
    pb=exp(-dAB*31.6/50*goBadRate); % 31.6(km) is the length of cell, 
                               % 50(km/h) is the velocity of vehicle,
                               % 0.08 is a parameter, seting larger
                               % will accelerate drugs' going bad on
                               % the way.
    pc=exp(-dAC*31.6/50*goBadRate);
elseif(distanceToB<distanceToA)&&(distanceToB<distanceToC)
    % B is the nearest
    pa=exp(-dAB*31.6/50*goBadRate);
    pb=1;
    pc=exp(-dBC*31.6/50*goBadRate);
else
    % C is the nearest
    pa=exp(-dAC*31.6/50*goBadRate);
    pb=exp(-dBC*31.6/50*goBadRate);
    pc=1;
end