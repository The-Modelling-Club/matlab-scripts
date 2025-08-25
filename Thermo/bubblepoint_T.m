format short g

A=[6.90565,6.95464];B=[1211.033,1344.8]; C=[220.79,219.48];
P=760;
Tb = (B(1)/(A(1)-log10(P)))-C(1);
Tt = (B(2)/(A(2)-log10(P)))-C(2);

To =(Tb+Tt)/2
fun = @Bubblepoint;
Tf =fzero(fun,To)



function Pot =Bubblepoint(T)
P=760;
A=[6.90565,6.95464];B=[1211.033,1344.8]; C=[220.79,219.48];
xa=0.5;
Pb=10^(A(1)-(B(1)/(C(1)+T)));
Pt=10^(A(2)-(B(2)/(C(2)+T)));
 Pdum =(Pb*xa)+(Pt*(1-xa));
Pot=(Pb*xa)+(Pt*(1-xa))-P;
end
