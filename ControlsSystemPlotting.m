%ppark

clear;clc

%-----Givens-----%

s = tf('s');
R = 0.05;        % meters
km = 0.2;        % V/s rad
C = 30e-6;       % henrys
D = 1;           % Laplace domain
J = 2.5e-4;      % kg^2 * m^2
Rm = 100;        % Ohm
H = s^2 + 1;     % Laplace domain

%-----%

B = (km/Rm) * (1 / ( 1+((km^2) * C) / J) );   %Variable in plant
G = (R/J) * (B / (s + (km/J*B)));    %Plant

T = (D*G)/(1+D*G*H);

%-----Plot-----%

figure(1);clf;hold all
pzmap(G);
figure(2)w
pzmap(T);
legend('G(s)','T(s)')

Gp = pole(G)
Gz = zero(G)

Tp = pole(T)
Tz = zero(T)
