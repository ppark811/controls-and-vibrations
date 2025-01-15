%ppark

clear;clc

y = [0 0];

%-----Soft Spring-----%

w1 = [24.4 29.6 33.3 34.6 42.2 46.5 48.8 50.6 54.5 57.5 61 65.7];
Xave1 = [0.429 1.128 1.098 1.086 0.898 0.874 1.01 0.664 0.768 0.9 0.787 0.806];
xinf1 = Xave1(10);

figure(1);clf
plot(w1, Xave1,'b-o');grid on; xlabel('Omega (1/s)');ylabel('Displacement (mm)')
title('Soft Spring frequency vs displacement')

wpeak1 = max(w1);
Xpeak1 = max(Xave1);
DM1 = Xave1/xinf1;

figure(2);clf
plot(log10(w1),log10(DM1),'r-o'); grid on; hold on
x = [1.35 1.85];
plot(x,y); ylabel('log(DM)');xlabel('log(omega)')
title('log(omega) vs log(DM)')

zeta1 = xinf1/(2*Xpeak1)

%-----Stiff Spring-----%

w2 = [24.7 27.1 30.4 33.4 38 42 42.1 47.7 49.3 54.3];
Xave2 = [1.107 1.058 1.425 2.207 1.543 1.34 1.643 1.165 1.2 1.067];
xinf2 = Xave2(10);

figure(3);clf
plot(w2, Xave2,'b-o');grid on; xlabel('Omega (1/s)');ylabel('Displacement (mm)')
title('Stiff Spring frequency vs displacement')

wpeak2 = max(w2);
Xpeak2 = max(Xave2);
DM2 = Xave2/xinf2;

figure(4);clf
plot(log10(w2),log10(DM2),'r-o'); grid on; hold on
x = [1.35 1.75];
plot(x,y); ylabel('log(DM)');xlabel('log(omega)')
title('log(omega) vs log(DM)')


zeta2 = xinf2/(2*Xpeak2)
