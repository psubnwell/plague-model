function initial()
global areaSide peoplePerCell time S I R infectionRate lastInfectionA lastInfectionB lastInfectionC;
global cai caj cbi cbj cci ccj ai aj bi bj ci cj;

outbreakA=[3.5,4,3.5;4,5,4;3.5,4,3.5];
outbreakB=[3.5,4,3.5;4,5,4;3.5,4,3.5]-1.5;
outbreakC=[3.5,4,3.5;4,5,4;3.5,4,3.5]-3;

cai=floor(0.3*areaSide);
caj=floor(0.3*areaSide);
cbi=floor(0.7*areaSide);
cbj=floor(0.3*areaSide);
cci=floor(0.5*areaSide);
ccj=floor(0.7*areaSide);

ai=cai-1:1:cai+1;
aj=caj-1:1:caj+1;
bi=cbi-1:1:cbi+1;
bj=cbj-1:1:cbj+1;
ci=cci-1:1:cci+1;
cj=ccj-1:1:ccj+1;

I(ai,aj)=outbreakA;
S=peoplePerCell-I;
I(bi,bj)=outbreakB;
S=peoplePerCell-I;
I(ci,cj)=outbreakC;
S=peoplePerCell-I;
infectionRate=I/peoplePerCell;