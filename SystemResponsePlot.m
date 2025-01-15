%ppark

clear;clc

%-----Givens-----%

k = 1000;
m = 10;
Fo = 100;
w = 8.162;
xo = 0.01;
vo = 0.01;
fo = Fo/m;
wn = sqrt(k/m);

%-----plot-----%

t = linspace(0,5,1000);
figure(1);clf
plot(t,(fo*(wn^2 - w^2))*cos(w*t) + (vo/w)*sin(w*t) + (xo - (fo/(wn^2-w^2)))*cos(w*t));grid on
xlabel('Time (s)')
ylabel('Displacement (m)')
title('Total response')
