



function Hdep  =  HDEP_TP_FG(T,P,y)
% Note 1=CO2, 2 =Water, 3=O2, 4=N2
Tc = [304.13, 647.096, 154.3, 126.2]; % K
Pc = [7.377e3,22.06e3,5043,3390]; % KPa
w = [0.225, 0.334, 0.022, 0.0372];

R=8.314;
kij =[0,0.07574+(6.649e-4)*(T-288.15),0.124,0.0015;...
    0.07574+(6.649e-4)*(T-288.15),0,0.2038+(3.2279e-3)*(T-288.15),-0.10540+(2.905e-3)*(T-288.15);...
0.124,0.2038+(3.2279e-3)*(T-288.15),0,-0.0119;...
0.0015,-0.10540+(2.905e-3)*(T-288.15),-0.0119,0];





% Compute TR parameters for each component
Tr = T ./ Tc;
m = 0.37464 + 1.54226 .* w - 0.26992 .* w .^2;
alpha = (1 + m .* (1 - sqrt(Tr))).^2;
a_i = 0.45724 * (R^2) .* Tc.^2 ./ Pc .* alpha;
b_i = 0.07780 * R .* Tc ./ Pc;
tau =(1+m)./sqrt(alpha)-1;
Ai = a_i * P / (R^2 * T^2);
%Bi = b_i* P / (R * T);

% Mixture parameters
a_mix = 0; teta_mix=0;
for i = 1:4
    for j = 1:4
        a_mix = a_mix + y(i)*y(j)*sqrt(a_i(i)*a_i(j))*(1 - kij(i,j));
        teta_mix=teta_mix+y(i)*y(j)*sqrt(Ai(i)*Ai(j))*(tau(i)+tau(j));
    end
end

b_mix = sum(y .* b_i);

% Define A and B for mixture
A = a_mix * P / (R^2 * T^2);
B = b_mix * P / (R * T);

% Solve PR cubic for Z
coeffs = [1, -(1 - B), A - 3*B^2 - 2*B, -(A*B - B^2 - B^3)];
Z_roots = roots(coeffs);
Z_real = max(real(Z_roots));  

% Compute entropy departure (in J/mol.K)
term1 =  Z_real - 1;
term2 = ((teta_mix+A) / ( sqrt(8) * B)) * log((Z_real + (1 + sqrt(2))*B)/(Z_real + (1 - sqrt(2))*B));
Hdep = (term1 - term2)*R*T;
end
