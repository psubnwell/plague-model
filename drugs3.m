function drugs3()
global areaSide peoplePerCell time S I R D maxDrugs;
global lastInfectionA lastInfectionB lastInfectionC deathTollDelivery;
global cai caj cbi cbj cci ccj;

if(mod(time-1,3)==0)
    weightA=1;
    weightB=0;
    weightC=0;
elseif(mod(time-2,3)==0)
    weightA=0;
    weightB=1;
    weightC=0;
else
    weightA=0;
    weightB=0;
    weightC=1;
end

amountA=maxDrugs*weightA;
amountB=maxDrugs*weightB;
amountC=maxDrugs*weightC;
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
            
