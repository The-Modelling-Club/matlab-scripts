
clc
HHV=55534;
design ={'Pin Air (kPa)','Pout Air (kPa)','Tin Air (K)','No of compression stages',' Compressor Efficiency','Air flowrate (kg/s)','Fuel flowrate (kg/s)','Turbine efficiency','Turbine exit pressure','Tin fuel'};
name='Brayton Cycle';
fieldsize =[1 80];
v=inputdlg(design,name,fieldsize);
vnum =str2double(v);
Pin=vnum(1); Pout= vnum(2);Tin=vnum(3);eff=vnum(5);mstar=vnum(6);
 num=vnum(4);Mfuel=vnum(7);TE=vnum(8);Pt_out =vnum(9); FT_in=vnum(10);
 
Min_air=(((Mfuel/16)*2)/0.21)*28.84;

TF =num==round(num)
while TF ~= 1
a=msgbox("No of compression stages must be an integer");
waitfor(a)
design ={'Pin Air (kPa)','Pout Air (kPa)','Tin Air (K)','No of compression stages',' Compressor Efficiency','Air flowrate (kg/s)','Fuel flowrate (kg/s)','Turbine efficiency','Turbine exit pressure','Tin fuel'};
name='Brayton Cycle';
fieldsize =[1 80];
v=inputdlg(design,name,fieldsize);
vnum =str2double(v);
Pin=vnum(1); Pout= vnum(2);Tin=vnum(3);eff=vnum(5);mstar=vnum(6);
 num=vnum(4);Mfuel=vnum(7);TE=vnum(8);Pt_out =vnum(9); FT_in=vnum(10);
TF =num==round(num);
end

while Pin >= Pout
a=msgbox("Pout must be greater than Pin");
waitfor(a)
design ={'Pin Air (kPa)','Pout Air (kPa)','Tin Air (K)','No of compression stages',' Compressor Efficiency','Air flowrate (kg/s)','Fuel flowrate (kg/s)','Turbine efficiency','Turbine exit pressure','Tin fuel'};
name='Brayton Cycle';
fieldsize =[1 80];
v=inputdlg(design,name,fieldsize);
vnum =str2double(v);
Pin=vnum(1); Pout= vnum(2);Tin=vnum(3);eff=vnum(5);mstar=vnum(6);
 num=vnum(4);Mfuel=vnum(7);TE=vnum(8);Pt_out =vnum(9); FT_in=vnum(10);
end

while (eff<=0)||(eff>1)
a=msgbox("Efficiency must be between 0 and 1");
waitfor(a)
design ={'Pin Air (kPa)','Pout Air (kPa)','Tin Air (K)','No of compression stages',' Compressor Efficiency','Air flowrate (kg/s)','Fuel flowrate (kg/s)','Turbine efficiency','Turbine exit pressure','Tin fuel'};
name='Brayton Cycle';
fieldsize =[1 80];
v=inputdlg(design,name,fieldsize);
vnum =str2double(v);
Pin=vnum(1); Pout= vnum(2);Tin=vnum(3);eff=vnum(5);mstar=vnum(6);
 num=vnum(4);Mfuel=vnum(7);TE=vnum(8);Pt_out =vnum(9); FT_in=vnum(10);
end

while (TE<=0)||(TE>1)
a=msgbox("Efficiency must be between 0 and 1");
waitfor(a)
design ={'Pin Air (kPa)','Pout Air (kPa)','Tin Air (K)','No of compression stages',' Compressor Efficiency','Air flowrate (kg/s)','Fuel flowrate (kg/s)','Turbine efficiency','Turbine exit pressure','Tin fuel'};
name='Brayton Cycle';
fieldsize =[1 80];
v=inputdlg(design,name,fieldsize);
vnum =str2double(v);
Pin=vnum(1); Pout= vnum(2);Tin=vnum(3);eff=vnum(5);mstar=vnum(6);
 num=vnum(4);Mfuel=vnum(7);TE=vnum(8);Pt_out =vnum(9); FT_in=vnum(10);
end

while mstar < Min_air
G=sprintf('The Minimum flowrate of Air should be %4.2f K',Min_air');
 a=msgbox(G);
waitfor(a)
design ={'Pin Air (kPa)','Pout Air (kPa)','Tin Air (K)','No of compression stages',' Compressor Efficiency','Air flowrate (kg/s)','Fuel flowrate (kg/s)','Turbine efficiency','Turbine exit pressure','Tin fuel'};
name='Brayton Cycle';
fieldsize =[1 80];
v=inputdlg(design,name,fieldsize);
vnum =str2double(v);
Pin=vnum(1); Pout= vnum(2);Tin=vnum(3);eff=vnum(5);mstar=vnum(6);
 num=vnum(4);Mfuel=vnum(7);TE=vnum(8);Pt_out =vnum(9); FT_in=vnum(10);
end

nstar=mstar/28.84;
Pbar_in=Pin/100; Pbar_out=Pout/100;
Pstar=((Pout/Pin)^(1/num))*Pin;
r=Pstar/Pin;
Tisen=iss(Tin,Pin,Pstar);

h_in_m=19.89*(FT_in-298)+(0.5)*(5.024e-2)*(FT_in^2-298^2)+(1/3)*(1.269e-5)*(FT_in^3-298^3)+...
(1/4)*(-11.01e-9)*(FT_in^4-298^4);

h_in=28.11*(Tin-298)+(0.5)*(0.11967e-2)*(Tin^2-298^2)+(1/3)*(0.4802e-5)*(Tin^3-298^3)+...
(1/4)*(-1.966e-9)*(Tin^4-298^4);
h_isen=28.11*(Tisen-298)+(0.5)*(0.11967e-2)*(Tisen^2-298^2)+(1/3)*(0.4802e-5)*(Tisen^3-298^3)+...
(1/4)*(-1.966e-9)*(Tisen^4-298^4);
w_isen=h_isen-h_in;
w_actual=w_isen/eff;
h_actual=w_actual+h_in;
T_actual=enthalpy(h_actual);
Power=nstar*w_actual*num;
n_fuel=Mfuel/16;
Hout=Mfuel*HHV+n_fuel*h_in_m+nstar*h_actual;
h_in_t=Hout/(n_fuel+nstar);
T_in_t=enthalpy(h_in_t);

while T_in_t > 1473
 a=msgbox('Temperature of stream entering the turbine is too high, increase the amount of air used');
waitfor(a)
design ={'Pin Air (kPa)','Pout Air (kPa)','Tin Air (K)','No of compression stages',' Compressor Efficiency','Air flowrate (kg/s)','Fuel flowrate (kg/s)','Turbine efficiency','Turbine exit pressure','Tin fuel'};
name='Brayton Cycle';
fieldsize =[1 80];
v=inputdlg(design,name,fieldsize);
vnum =str2double(v);
Pin=vnum(1); Pout= vnum(2);Tin=vnum(3);eff=vnum(5);mstar=vnum(6);
 num=vnum(4);Mfuel=vnum(7);TE=vnum(8);Pt_out =vnum(9); FT_in=vnum(10);
 
 nstar=mstar/28.84;
Pbar_in=Pin/100; Pbar_out=Pout/100;
Pstar=((Pout/Pin)^(1/num))*Pin;
r=Pstar/Pin;
Tisen=iss(Tin,Pin,Pstar);

h_in_m=19.89*(FT_in-298)+(0.5)*(5.024e-2)*(FT_in^2-298^2)+(1/3)*(1.269e-5)*(FT_in^3-298^3)+...
(1/4)*(-11.01e-9)*(FT_in^4-298^4);

h_in=28.11*(Tin-298)+(0.5)*(0.11967e-2)*(Tin^2-298^2)+(1/3)*(0.4802e-5)*(Tin^3-298^3)+...
(1/4)*(-1.966e-9)*(Tin^4-298^4);
h_isen=28.11*(Tisen-298)+(0.5)*(0.11967e-2)*(Tisen^2-298^2)+(1/3)*(0.4802e-5)*(Tisen^3-298^3)+...
(1/4)*(-1.966e-9)*(Tisen^4-298^4);
w_isen=h_isen-h_in;
w_actual=w_isen/eff;
h_actual=w_actual+h_in;
T_actual=enthalpy(h_actual);
Power=nstar*w_actual*num;
n_fuel=Mfuel/16;
Hout=Mfuel*HHV+n_fuel*h_in_m+nstar*h_actual;
h_in_t=Hout/(n_fuel+nstar);
T_in_t=enthalpy(h_in_t);
end
%Calculating the isentropic temperature of the turbine
TIT=iss(T_in_t,Pout,Pt_out);
%Calculating the isentropic enthlapy of the turbine
h_in_turbine=28.11*(T_in_t-298)+(0.5)*(0.11967e-2)*(T_in_t^2-298^2)+(1/3)*(0.4802e-5)*(T_in_t^3-298^3)+...
(1/4)*(-1.966e-9)*(T_in_t^4-298^4);
h_isent=28.11*(TIT-298)+(0.5)*(0.11967e-2)*(TIT^2-298^2)+(1/3)*(0.4802e-5)*(TIT^3-298^3)+...
(1/4)*(-1.966e-9)*(TIT^4-298^4);
w_isen_t=(h_in_turbine-h_isent);
w_actual_t=w_isen_t*TE;
h_actual_t=h_in_turbine-w_actual_t;
T_out_t=enthalpy(h_actual_t);
W_turbine=(n_fuel+nstar)*w_actual_t;
W_cycle=W_turbine-Power;
CF=(100*W_cycle)/(Mfuel*HHV);

Factor = ["Comp_Power";"Compressor outlet Temperature";"Pressure Ratio";"Turbine inlet temperature";"Turbine out temperature";"Turbine power";"Net power";"Cycle efficiency"];
Value  =[Power;T_actual;r;T_in_t;T_out_t;W_turbine;W_cycle;CF];
Units = ["kW";"K";"-";"K";"K";"kW";"kW";"%"];
Out=table(Factor,Value,Units);
% I don't fully get this line of coding but it is to help project the
% results
fig =uifigure;
tt=uitable(fig,"Data",Out);



function F=enthalpy(h_acutal)
 fun=@enn;
 To=400;
    F=fzero(fun,To);
    function A=enn(Tout)
A=h_acutal-(28.11*(Tout-298)+(0.5)*(0.11967e-2)*(Tout^2-298^2)+(1/3)*(0.4802e-5)*(Tout^3-298^3)+...
(1/4)*(-1.966e-9)*(Tout^4-298^4));
    end
end

function Tisen=iss(Tin, Pin, Pstar)
Fun= @isentropic;
To=Tin*(Pstar/Pin)^(0.4/1.4);
Tisen=fzero(Fun,To);
function F=isentropic(Tout)
Ent_in=28.11*log(Tin/298)+(0.11967e-2)*(Tin-298)+(0.5)*(0.4802e-5)*(Tin^2-298^2)+...
(1/3)*(-1.966e-9)*(Tin^3-298^3)-8.314*log(Pin/101.325);
Ent_out=28.11*log(Tout/298)+(0.11967e-2)*(Tout-298)+(0.5)*(0.4802e-5)*(Tout^2-298^2)+...
(1/3)*(-1.966e-9)*(Tout^3-298^3)-8.314*log(Pstar/101.325);
F=Ent_out-Ent_in;
end
end