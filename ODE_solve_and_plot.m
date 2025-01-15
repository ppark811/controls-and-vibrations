%ppark

clear;clc

syms y(t)
Dy = diff(y);

ode = 5*diff(y,t,2) == -2*diff(y,t,1) - 2*y;
cond1 = y(0) == 1;
cond2 = Dy(0) ==0;

conds = [cond1 cond2];
ySol(t) = dsolve(ode,conds);
ySol = simplify(ySol);
disp(ySol)
