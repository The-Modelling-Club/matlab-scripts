tr=linspace(0,12,20);
Co =[1,250,0];
[t,C]=ode45(@Batch,tr,Co);
subplot(2,1,1)
plot(t,C(:,1))
xlabel('time')
ylabel('concentration of cells')
subplot(2,1,2)
plot(t,C(:,2),t,C(:,3))
xlabel('time')
ylabel('concentration')
legend('Substrate','Product')

Cp =93;
miumax=0.33;n=0.52; Ycs=0.08; Yps=0.45; Ypc=5.6; ks=1.7; kd=0.01;
m=0.03; kobs= ((1-C(:,3)./Cp).^n); rg=miumax*(kobs).*((C(:,1).*C(:,2))./(ks+C(:,2)));
rd=kd.*C(:,1); rsm=m.*C(:,1); Ysc=1/Ycs;

function DCDT =Batch(t,C)
Cp =93;
miumax=0.33;n=0.52; Ycs=0.08; Yps=0.45; Ypc=5.6; ks=1.7; kd=0.01;
m=0.03; kobs= ((1-C(3)/Cp)^n); rg=miumax*(kobs)*((C(1)*C(2))/(ks+C(2)));
rd=kd*C(1); rsm=m*C(1);
% conc 1 is cells, conc 2 is substrate conc 3 is product
dC(1)=rg-rd;
dC(2)=(-1)*(1/Ycs)*rg-rsm;
dC(3)=Ypc*rg;
DCDT=[dC(1);dC(2);dC(3)];
end