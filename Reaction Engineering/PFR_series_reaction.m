

tr=linspace(0,100,50);
Fo =[5,0,0];
[t,F]=ode45(@PFR,tr,Fo);
plot(t,F(:,1),t,F(:,2),t,F(:,3))
xlabel('Volume in litres')
ylabel('Molar flowrate')
legend('Fa','Fb','Fc')

function dfdv =PFR(v,F)
Cao=2;Cbo=0;Cco=0;Cto=Cao+Cbo+Cco;Ft=F(1)+F(2)+F(3);
Ca=(F(1)/Ft)*Cto; Cb=(F(2)/Ft)*Cto;Fao=5;
kone=0.5; ktwo=0.2;ra=kone*Ca; rb=ktwo*Cb;
dF(1)=ra*(-1);
dF(2)=ra-rb;
dF(3)=rb;
dfdv=[dF(1);dF(2);dF(3)];
end