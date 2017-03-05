clear all;
clear;

global areaSide peoplePerCell time S I R D infectionRate migrationRate;
global contactFactor deteriorateFactor recoveryFactor ;
global lastInfectionA lastInfectionB lastInfectionC maxDrugs diffuseRate 
global deathToll deathTollDelivery goBadRate;
global cai caj cbi cbj cci ccj ai aj bi bj ci cj;

% Control parameters
areaSide=20; % 1000km^2/cell
peoplePerCell=400.0;
time=0; % 0.5month/time
migrationRate=0.2;
contactFactor=9e-4;
deteriorateFactor=0.1087;
recoveryFactor=0.01;
maxDrugs=30;
diffuseRate=1;
deathToll=0;
deathTollDelivery=0;
goBadRate=0.08;

S=peoplePerCell*ones(areaSide,areaSide,1);
I=zeros(areaSide,areaSide,1);
R=zeros(areaSide,areaSide,1);
D=zeros(areaSide,areaSide,1);
infectionRate=I/peoplePerCell;

initial();

for time=1:24
    lastInfectionA=sum(sum(I(ai,aj)));
    lastInfectionB=sum(sum(I(bi,bj)));
    lastInfectionC=sum(sum(I(ci,cj)));
    if(time>15)
        drugs3();
    end
    virus();
    
    %{
    %if(time==24)
    %if(mod(time,2)==0)
        show=time/2.0;
        subplot(3,4,show);
        surf(1:areaSide,1:areaSide,I);
        colormap(white);
        axis([0,areaSide,0,areaSide,0,50]);
        title(['time=',num2str(time/2.0),'st month']);
        xlabel('x');
        ylabel('y');
        zlabel('Infectors');
    %end
    %}
    
    
    %if(time==24)
    if(mod(time,2)==0)
        show=time/2.0;
        subplot(3,4,show);
        % bar3(I);
        amro_bar3(I);
        % surf(I);
        colormap(white);
        axis([0,areaSide,0,areaSide,0,50]);
        title(['time=',num2str(time/2.0),'month']);
        xlabel('x');
        ylabel('y');
        zlabel('Infectors');
    end
    
end
remains=sum(sum(I));
fprintf('Number of remaining infected people = %5.2f\n',remains);
fprintf('Death toll                          = %5.2f\n',deathToll);
fprintf('Death toll caused by delivery       = %5.2f\n',deathTollDelivery);
fprintf('Death toll caused by delivery       = %5.2f%%\n',deathTollDelivery/deathToll*100);