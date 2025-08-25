X0=[0,305,315];
Vm = 5; % max Volume
vr =linspace(0,Vm,100);
[V,X] =ode45(@catr,vr,X0);

Fao =163*0.9*0.1;Cao=9.3;k1=31.1;ke1=3.03;E=65700;hr=-34500;
beta=141+(1/9)*161;
kf =k1*exp((E/8.314).*((1/360)-(1./X(:,2))));
kef=ke1*exp(((-1)*hr/8.314).*((1./X(:,2))-(1/333)));
Ca=Cao.*(1-X(:,1)); Cb=Cao.*X(:,1);
ra=kf.*(Ca-Cb./kef);
xe=kef./(1+kef);

plot(V,X(:,1),V,xe)
xlabel('Volume of reactor,L')
ylabel('Conversion')
legend('X','Xe')



function dXdV =catr(V,X)
Fao =163*0.9*0.1;Ua=5000;
Cao=1.86;k1=31.1;ke1=3.03;E=65700;
mc=500; cpc=28;
hr=-34500;
beta=141+(1/9)*161;
kf =k1*exp((E/8.314).*((1/360)-(1./X(2))));
kef=ke1*exp(((-1)*hr/8.314).*((1./X(2))-(1/333)));
Ca=Cao*(1-X(1)); Cb=Cao*X(1);
ra=kf*(Ca-Cb/kef);
dX(1) =ra/Fao;
dX(2) =((Ua*((X(3)-X(2))))-hr*ra)/(Fao*beta);
dX(3) =((Ua*((X(2)-X(3)))))/(mc*cpc);
dXdV=[dX(1);dX(2);dX(3)];

end