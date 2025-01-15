%ppark

clear;clc

%Part e

step = 0.006585;
f(1) = 0.0817;
t = 0:step:2;

for x = 1:length(t)-1
    f(x+1) = f(x) + (-300*step*f(x));
end

figure(1);clf
plot(t,f);grid on
title('Euler Method');xlabel('time(s)');ylabel('f(x)')

%Part f
tspan = [0 2];
y0 = 0.0817;
[t,y] = ode45(@(t,y) -300*t, tspan, y0); 
figure(2);clf
plot(t,y)
title('ODE45');xlabel('time(s)');ylabel('f(x)')
