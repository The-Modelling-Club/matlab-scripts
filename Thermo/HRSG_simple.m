clear
mg=2000;Cp=1.051;
Tg_in=600; Tg_out=100;
q=mg*Cp*(Tg_in-Tg_out)
hw_in=104.83; hhp=3375.11;
hlp=3067.1;
q_hp=hhp-hw_in;
q_lp=hlp-hw_in;
h_out=2608.9;
w_hp=hhp-h_out; w_lp=hlp-h_out;
A=[q_hp,q_lp;0,-1*q_lp];
B=[q;-0.3*q]; lb=[0,0]; ub=[inf,inf];
f=[-1*w_hp,-1*w_lp];
Aeq=[];Beq=[];
[x,y]=linprog(f,A,B,Aeq,Beq,lb,ub)
HP_power=x(1)*w_hp;
LP_power =x(2)*w_lp;

function [C,Ceq] =non(x)
mg=2000;Cp=1.051;
Tg_in=600; 
C=Tg_in-x(1)*1317.6/(mg*Cp)-15;
Ceq=[]
end
