%ppark

clear;clc

%-----Part I-----%

sysi = tf((1),[1 4 8]);             %plant
figure(1);clf
rlocus(sysi);
title('Uncompensated Root-Locus')

%-----Part II-----%

sysii = tf([1 6.41],[1 4 8]);       %plant with controller
figure(2);clf
rlocus(sysii)
title('Root-Locus with PD-controller')

%-----Part V-----%

sysv = tf([1 6.41],[1 5 14.41]);    %system transfer function
t = linspace(0,5,1000);
figure(3);clf
step(sysv,t);

%-----Part VI-----%

s = stepinfo(sysv);
disp(s)
