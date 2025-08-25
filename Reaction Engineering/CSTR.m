
Fo =[1,1,1]; a=[1:1:100];

for V=1:1:100
    t=eva(V,Fo);
    Fa(V)=t(1);
    Fb(V)=t(2);
    Fc(V)=t(3);
end
plot(a,Fa,a,Fb,a,Fc)
xlabel('V in litres')
ylabel('Molar Flowrate')
legend('Fa','Fb','Fc')

function x=eva(V,Fo)
fun=@CSTR;
x=fsolve(fun,Fo);
function G =CSTR(F)
%V=10;
Cao=2;Cbo=0;Cco=0;Cto=Cao+Cbo+Cco;Ft=F(1)+F(2)+F(3);
Ca=(F(1)/Ft)*Cto; Cb=(F(2)/Ft)*Cto;Fao=5;
kone=0.5; ktwo=0.2;r1=kone*Ca; r2=ktwo*Cb;
G(1)=Fao-r1.*V-F(1);
G(2)=F(2)-(r1-r2).*V;
G(3)=F(3)-r2.*V;
end
end