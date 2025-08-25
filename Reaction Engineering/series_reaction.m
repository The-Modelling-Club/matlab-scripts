

tr=linspace(0,10,50);
Co =[2,0,0];
[t,c]=ode45(@batch,tr,Co);
plot(t,c(:,1),t,c(:,2),t,c(:,3))
xlabel('time in hrs')
ylabel('Concentration in mol/L')
legend('Ca','Cb','Cc')

function dcdt =batch(t,c)
kone=0.5; ktwo=0.2;
dc(1)=kone*c(1)*(-1);
dc(2)=kone*c(1)-ktwo*c(2);
dc(3)=ktwo*c(2);
dcdt=[dc(1);dc(2);dc(3)];
end