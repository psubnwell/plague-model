function virus()
global areaSide peoplePerCell S I R D infectionRate migrationRate;
global contactFactor deteriorateFactor recoveryFactor deathToll;

for i=2:areaSide-1
    for j=2:areaSide-1
        D(i,j)=deteriorateFactor*I(i,j);
        deathToll=deathToll+D(i,j);
        I(i,j)=(I(i-1,j-1)+I(i,j-1)+I(i+1,j-1)+...
                I(i-1,j)  +I(i,j)+  I(i+1,j)+...
                I(i-1,j+1)+I(i,j+1)+I(i+1,j+1))/8.0*migrationRate+...
                I(i,j)*exp((contactFactor*S(i,j)-deteriorateFactor-recoveryFactor))-...
                I(i,j)*migrationRate-deteriorateFactor*I(i,j);
        if(I(i,j)>peoplePerCell-D(i,j)-R(i,j))
            I(i,j)=peoplePerCell-D(i,j)-R(i,j);
        end
        S(i,j)=peoplePerCell-I(i,j)-D(i,j)-R(i,j);
    end
end

infectionRate=I/peoplePerCell;