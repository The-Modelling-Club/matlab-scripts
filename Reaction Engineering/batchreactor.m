clc
tspan=linspace(0,200,50);
Co=[1,1,0,0];
[t,Ci] =ode45(@batch,tspan,Co);
plot(t,Ci(:,1),t,Ci(:,2),t,Ci(:,3),t,Ci(:,4))
xlabel('time in seconds')
ylabel ('concentration in kmol/m^3')
legend('A','B','D','U')

title('Concentration profile in a reactor')

function dcdt=batch(t,c)
T=500;
k1a=(1.1*10^7)*exp(-9200/T);
k2a=4*exp(-2000/T);
dc(1)=-k1a*c(1).*c(2)-k2a*(c(1).^0.5).*(c(2).^1.5);
dc(2)=-k1a*c(1).*c(2)-k2a*(c(1).^0.5).*(c(2).^1.5);
dc(3)=k1a*c(1).*c(2);
dc(4)=k2a*(c(1).^0.5).*(c(2).^1.5);
dcdt=[dc(1);dc(2);dc(3);dc(4)];
end

