vr=linspace(0,20,100);
Fo =[100,0,0];
[v,Fi] =ode45(@plug,vr,Fo);
plot(v,Fi(:,1),v,Fi(:,2),v,Fi(:,3))
xlabel('Volume of reactor, dm^3')
ylabel('Flowrate of species kmol/s')
legend('Fa','Fb','Fc');
Fao=100;Q=100;  Cto=Fao/Q;
Ft=Fi(:,1)+Fi(:,2)+Fi(:,3);Ca=Cto*(Fi(:,1)./Ft);Cb=Cto*(Fi(:,2)./Ft);
Cc=Cto*(Fi(:,3)./Ft);
k=10;ke=0.01;kc2=40;kc1=1;
ra=k*(-1)*(Ca-((Cb.*Cc)/ke))

function dfdv =plug(V,F)
Fao=100;Q=100;  Cto=Fao/Q;
Ft=F(1)+F(2)+F(3);Ca=Cto*(F(1)./Ft);Cb=Cto*(F(2)./Ft);
Cc=Cto*(F(3)./Ft);
k=10;ke=0.01;kc2=40;kc1=1;
ra=k*(-1)*(Ca-((Cb.*Cc)/ke))
rb=ra*(-1); rc=ra*(-2);
Rb=kc2*Cb;
Ra=kc1*Ca;
df(1)= ra-Ra;
df(2)= rb-Rb;
df(3)= rc;
dfdv= [df(1);df(2);df(3)];
end