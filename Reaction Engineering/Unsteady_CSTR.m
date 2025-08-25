clc
tr=linspace(0,4,100);Co =[0,55.36,0,0,297];
[t,c]=ode45(@CSTR,tr,Co);
Ca=c(:,1); T=c(:,5);
 
figure(1),plot(t,Ca);xlabel('time in hours');ylabel('Concentration of propylene oxide in mol/L');
title('Concentration profile in a non-isothermal CSTR in a transient state')
figure(2), plot(t,T,'r');xlabel('time in hours');ylabel('T(K)');
title('Temperature profile in a non-isothermal CSTR in a transient state')
figure(3), plot(T,Ca); xlabel('T(K)');ylabel('Concentration of propylene oxide in mol/L');
title('Temperature-Concentration changes in a CSTR in a transient state')
function dcdt =CSTR(t,c)
%Data
Fain=36.28;Fbin=453.59; Fmin=45.36;Cbp=55.56;Cap=14.785;Cmp=24.668;
Tin=297; dh=83707;UA=30385.60; m=453.592;Cp=4.184;Ta1=289;  Cpa=146.54; Cpb=75.36;Cpc=192.590; Cpm=81.64;  V=1.893;
%Computing Volumetric flowrate Q and Feed concentrations and Tau
 Q=((Fain/Cap)+(Fbin/Cbp)+(Fmin/Cmp));
 Cao=Fain/Q; Cbo=Fbin/Q;Cmo=Fmin/Q; tau=V/Q;
% Assigning new names to the variables
Ca=c(1); Cb=c(2); Cc=c(3); Cm=c(4); T=c(5);
 % Computing k  and Reaction rate
k=(16.96e12)*exp((-75369.63/8.314)*(1/(T-6.4)));
ra=k*Ca;
 % Computing heat generated and heat removed 
 y=(UA)/(m*Cp); Na=Ca*V;Nb=Cb*V;Nc=Cc*V;Nm=Cm*V;
 Qc=m*Cp*(T-Ta1)*(1-(exp(-1*y)))+(Fain*Cpa+Fbin*Cpb+Fmin*Cpm)*(T-Tin);
 Qr=V*dh*ra; dQ=Qr-Qc; 
  NCp= (Na*Cpa+Nb*Cpb+Nc*Cpc+Nm*Cpm);
  % Differential equations
dCa=(-1)*ra+(Cao-Ca)/tau;
dCb=(-1)*ra+(Cbo-Cb)/tau;
dCc=ra-Cc/tau;
dCm=Q.*(Cmo-Cm)./V;
DT=dQ/NCp;
dcdt=[dCa;dCb;dCc;dCm;DT];
end