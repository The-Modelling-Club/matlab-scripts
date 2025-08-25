
clc

tspan=linspace(0,4000,20);
xo=0;
[t,X]=ode45(@batchT,tspan,xo);
 T=286+79.96*X;
 figure(1), plot(t,X)
 xlabel('time (s)'); ylabel('X'); title('Concentration profile')
  figure(2), plot(t,T)
 xlabel('time (s)'); ylabel('Temperature (Kelvin)'); title('Temperature profile')


function dxdt=batchT(t,x)
T=286+79.96*x;
k=(2.73*10^(-4) )*exp(-9059*((1/T)-(1/297)));
dxdt=k*(1-x);
end