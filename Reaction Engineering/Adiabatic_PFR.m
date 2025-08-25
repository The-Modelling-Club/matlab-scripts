X0=0;
Vm = 8; % max Volume
vr =linspace(0,Vm,100);
[V,X] =ode45(@catr,vr,X0);

Fao =163*0.9;Cao=9.3;k1=31.1;ke1=3.03;E=65700;hr=-6900;To=330;
beta=141+(1/9)*161;
T=To-(hr.*X)/beta;
kf =k1*exp((E/8.314).*((1/360)-(1./T)));
kef=ke1*exp(((-1)*hr/8.314).*((1./T)-(1/333)));
Ca=Cao.*(1-X); Cb=Cao.*X;
ra=kf.*(Ca-Cb./kef);

subplot(3,1,1)
plot(V,X)
xlabel('Volume of reactor,L')
ylabel('Conversion')

subplot(3,1,2)
plot(V,T)
xlabel('Volume of reactor,L')
ylabel('Temperature')

subplot(3,1,3)
plot(V,ra)
xlabel('Volume of reactor,L')
ylabel('-ra')



function dXdV =catr(V,X)
Fao =163*0.9;
Cao=9.3;k1=31.1;ke1=3.03;E=65700;hr=-6900;To=330;
beta=141+(1/9)*161;
T=To-(hr*X)/beta;
kf =k1*exp((E/8.314)*((1/360)-(1/T)));
kef=ke1*exp(((-1)*hr/8.314)*((1/T)-(1/333)));
Ca=Cao*(1-X); Cb=Cao*X;
ra=kf*(Ca-Cb/kef);
dXdV=ra/Fao;

end