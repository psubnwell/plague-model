function drugs1()
global areaSide peoplePerCell time S I R D maxDrugs
global lastInfectionA lastInfectionB lastInfectionC deathTollDelivery;

[pa,pb,pc]=judge();

amountA=maxDrugs/3*pa;
amountB=maxDrugs/3*pb;
amountC=maxDrugs/3*pc;
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
            
