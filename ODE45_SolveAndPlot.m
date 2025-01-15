%ppark

clear;clc

%-----Part a-----%

tspan = 0:0.001:3;
initial_x=1;
initial_dxdt=0;

[tspan,x] = ode45(@(t,x) 2*d2x/dt2 + dx/dt + 5*x == 0, tspan, [initial_x initial_dxdt]);

plot(tspan,x);
xlabel('t');ylabel('x')

%-----Part b-----%

[tspan,x] = ode45(@(t,x) 2*d2x/dt2 + sqrt(40)*dx/dt + 5*x == 0, tspan, [initial_x initial_dxdt]);

plot(tspan,x);
xlabel('t');ylabel('x')

%-----Part c-----%

[tspan,x] = ode45(@(t,x) 2*d2x/dt2 + 9*dx/dt + 5*x == 0, tspan, [initial_x initial_dxdt]);

plot(tspan,x);
xlabel('t');ylabel('x')
