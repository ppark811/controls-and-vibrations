%ppark

clear;clc
b = [2e3 1e4 5e4];
for i = 1:3
syms y(t)
Dy = diff(y);

ode = 1800*diff(y,t,2) == -4*b(i)*diff(y,t,1) - 1.6e5*y;
cond1 = y(0) == .1;
cond2 = Dy(0) == 0;

conds = [cond1 cond2];
ySol(t) = dsolve(ode,conds);
ySol = simplify(ySol);

figure(i);clf
fplot(ySol,[0,2])
title(['Effect of damping for b = ',sprintf('%d',b(i)),' Ns/m'])
xlabel('Time (s)');ylabel('Displacement (m)')
end
