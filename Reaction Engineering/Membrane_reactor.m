
vr=linspace(0,400,200);
Fo =[10,0,0];
[v,Fi] =ode113(@plug,vr,Fo);
plot(v,Fi(:,1),v,Fi(:,2),v,Fi(:,3))
xlabel('Volume of reactor, dm^3')
ylabel('Flowrate of species mol/min')
legend('Fa','Fb','Fc')


function dfdv =plug(V,F)
T=500;P=8.2*101.325; R=8.314; Cto=P/(R*T);
Ft=F(1)+F(2)+F(3);Ca=Cto*(F(1)./Ft);Cb=Cto*(F(2)./Ft);
Cc=Cto*(F(3)./Ft);
k=0.7;ke=0.05;kc=0.2;
ra=k*(-1)*(Ca-((Cb.*Cc)/ke));
rb=ra*(-1); rc=ra*(-1);
Rb=kc*Cb;
df(1)= ra;
df(2)= rb-Rb;
df(3)= rc;
dfdv= [df(1);df(2);df(3)];
end
