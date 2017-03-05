function [drugsNet]=assign(amountA,amountB,amountC)
global areaSide;
global cai caj cbi cbj cci ccj diffuseRate;

m=zeros(areaSide);
for i=2:areaSide-1
    for j=2:areaSide-1
        m(i,j)=amountA/sqrt(pi*diffuseRate)*exp(-((i-cai)^2+(j-caj)^2)/(4*diffuseRate))+...
               amountB/sqrt(pi*diffuseRate)*exp(-((i-cbi)^2+(j-cbj)^2)/(4*diffuseRate))+...
               amountC/sqrt(pi*diffuseRate)*exp(-((i-cci)^2+(j-ccj)^2)/(4*diffuseRate));
    end
end
drugsNet=m;