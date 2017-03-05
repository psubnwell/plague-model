function drugs4()
global areaSide peoplePerCell time S I R D maxDrugs;
global lastInfectionA lastInfectionB lastInfectionC deathTollDelivery;
global cai caj cbi cbj cci ccj;

x=1:areaSide;
ya=I(cai,:);
yb=I(cbi,:);
yc=I(cci,:);
xx=1:.01:areaSide;
yia=interp1(x,ya,xx,'spline');
yib=interp1(x,yb,xx,'spline');
yic=interp1(x,yc,xx,'spline');
pa=polyfit(xx,yia,6);
pb=polyfit(xx,yib,6);
pc=polyfit(xx,yic,6);
dpa=polyder(pa);
dpb=polyder(pb);
dpc=polyder(pc);
dyya=abs(polyval(dpa,xx));
dyyb=abs(polyval(dpb,xx));
dyyc=abs(polyval(dpc,xx));
mA=max(max(dyya));
mB=max(max(dyyb));
mC=max(max(dyyc));

trendA=mA/(mA+mB+mC);
trendB=mB/(mA+mB+mC);
trendC=mC/(mA+mB+mC);

demandA=lastInfectionA/(lastInfectionA+lastInfectionB+lastInfectionC);
demandB=lastInfectionB/(lastInfectionA+lastInfectionB+lastInfectionC);
demandC=lastInfectionC/(lastInfectionA+lastInfectionB+lastInfectionC);

%maxInfection=max(max(I));
%[i j]=find(I==maxInfection);
%(sum(sum(I(ai,aj)))-I(cai,caj))/8.0

[pa,pb,pc]=judge();

%weightA=trendA/(trendA+trendB+trendC);
%weightB=trendB/(trendA+trendB+trendC);
%weightC=trendC/(trendA+trendB+trendC);

weightA=(trendA*0.5+demandA*1.5)/2.0;
weightB=(trendB*0.5+demandB*1.5)/2.0;
weightC=(trendC*0.5+demandC*1.5)/2.0;

amountA=maxDrugs*weightA*pa;
amountB=maxDrugs*weightB*pb;
amountC=maxDrugs*weightC*pc;
store=0;
deathTollDelivery=deathTollDelivery+maxDrugs-amountA-amountB-amountC;

drugsNet=assign(amountA,amountB,amountC);

for i=2:areaSide-1
    for j=2:areaSide-1
        if(I(i,j)>=drugsNet(i,j)+store)
            I(i,j)=I(i,j)-drugsNet(i,j)-store;
            R(i,j)=R(i,j)+drugsNet(i,j)+store;
        else
            I(i,j)=0;
            store=drugsNet(i,j)+store/2.0-I(i,j);
        end
    end
end
            
