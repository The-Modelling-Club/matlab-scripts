clc
Fbo=0.1*60;Cbo=1.5;Q=Fbo/Cbo;kone=5.1;
Vo=1500;Vmax=2500;tmax=(Vmax-Vo)/Q
tr=linspace(0,tmax,10);
Co =[0.75,0,0.01,0.02,0];
[t,c]=ode45(@batch,tr,Co);
V=Vo+Q*t;
n=V.*c;
ra=kone*c(:,1).*c(:,2);
yyaxis left
plot(t,n(:,1),'-b',t,n(:,2),'*k',t,n(:,3),'dk',t,n(:,4),t,n(:,5))
xlabel('time in hrs')
ylabel('Concentration in mol/L')
hold on
yyaxis right
plot(t,ra,'r')
ylabel('-ra in mol/Lhr')
legend('Na','Nb','Nc','Nd','Ne','-ra')

function dcdt =batch(t,c)
Fbo=0.1*60;Cbo=1.5;Q=Fbo/Cbo;Vo=1500;
kone=5.1; V=Vo+Q*t;
dc(1)=(-1)*kone*c(1)*c(2)-Q.*c(1)./V;
dc(2)=(-1)*kone*c(1)*c(2)+Q.*(Cbo-c(2))./V;
dc(3)=kone*c(1)*c(2)-Q.*c(3)./V;
dc(4)=kone*c(1)*c(2)-Q.*c(4)./V;
dc(5)=kone*c(1)*c(2)-Q.*c(5)./V;
dcdt=[dc(1);dc(2);dc(3);dc(4);dc(5)];
end