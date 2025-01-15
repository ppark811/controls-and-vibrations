%ppark

clear;clc

%-----problem 2b-----%

%---part i---%

sysi = tf([1],[1 4 8]);                 %plant
figure(1);clf
rlocus(sysi)
title('Uncompensated Root-Locus')

%---part ii---%

sysii = tf([1 3.63],[1 14 48 80]);   %plant with controller
figure(2);clf
rlocus(sysii)
title('Root Locus with Lead-Controller')

%---part iii---%

figure(3);clf
rlocus(sysii)
zgrid([0.69],[])

%using the root locus and finding the point where overshoot is 5%,
%the gain is given to be K = 33 (image attached)

%---part iv---%

sysiv = tf([33 119.79],[1 14 81 199.79]);  %system transfer function with gain found above
figure(4);clf
rlocus(sysiv)
title('System Transfer Function with K=33')

%---part v---%

sysv = sysiv;
figure(5);clf
t = linspace(0,5,1000);
step(sysv,t);

%---part vi---%

vi = stepinfo(sysv);
fprintf('    System with lead controller: \n \n')
disp(vi)
fprintf('------------------------------------- \n \n')
%I would suggest the lead pole be much lower than -10. It seems
%to be influencing the overshoot heavily. Running this again but with 
%plead=-100 drops overshoot and raises settling time to what is wanted

%-----problem 3-----%

%---part b---%

sysb = tf([33 41.811],[1 4.1 41.4 42.611]);
figure(6);clf
rlocus(sysb)
zgrid([0.69],[])
title('System with lag controller')

%---part c---%

figure(7);clf
step(sysb,t);

%---part d---%

d = stepinfo(sysb);
fprintf('    System with lag controllers: \n \n')
disp(d)

%the lag controller makes it such that the system ends up having a better
%steady state error, but the trade off for this is high overshoot and some
%oscillation. The oscillation does decay fast but a lead/lag controller was
%built, it could reduce overshoot and get the steadystate error to be what
%the user wants.
