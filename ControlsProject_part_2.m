%ppark

clear;clc

%-----Givens-----%

s = tf('s');
m1 = 100;       %kg
m2 = 160;       %kg
k1 = 2000;      %N/m
k2 = 3200;      %N/m
b = 1200;       %Ns/m

%-----State Space Model-----%

A = [0 -1 0 0; k1/m1 -b/m1 -k2/m1 0; 0 1 0 -1; 0 0 k2/m2 0];    %matrix of system components
B = [1; b/m1; 0; 0];                                            %matrix of input into system
C = [0 0 0 1; k1 -b 0 0];                                       %matrix of output
D = [ 0; b];                                                    %matrix of output of system

%-----Transfer Functions-----%

sys_ss = ss(A,B,C,D);   %Creating state space model of system
sys_tf = tf(sys_ss);    %Creating transfer function from state space model

G1 = sys_tf(1)/s;       %Position of m2
G2 = sys_tf(2);         %Force on actuator
G3 = sys_tf(1)*s;       %Acceleration of m2

p = pole(G1);           %Determining poles of X2(s)
z = zero(G1);           %Determining zeros of X2(s)

fbG1 = 2*feedback(G1,1);

figure(1);clf;rlocus(G1);title('Uncompensated root locus');zgrid([.5519],[])
xlim([-8,3]);ylim([-7,7]);  
figure(2);clf;
stepfbG1 = step(fbG1); 
t = linspace(0,10,length(stepfbG1));
plot(t,stepfbG1);grid on; grid minor
title('Step response of uncompensated position of mass 2')
xlabel('Time (s)');ylabel('Displacement (m)')

%-----Controller design-----%

%The controller design will be a lead-lag. The lead lag seems to be the
%most optimal controller design. When working through it, the lag it became
%evident that the lag controller was not needed, so a simple lead
%controller was used.

OS = 10;                %picked 10% rather than the needed 12.5%
ts = 2;                 %arbritrary settling time (close to what dr.adams had)

%-desired pole location-%

zeta = sqrt((log(100/OS)^2)/(pi^2+log(100/OS)^2));
theta = asin(zeta);
sigma = -4/ts;              %determining real part of desired pole
omega = sigma/tan(theta);   %determining imaginary part of desired pole

zlead = 3.55;               %found on paper after 3 iterations
plead = 1;                  %randomly selected pole, from third iteration
k = .27;                    %gain

D = k*(s+zlead)/(s+plead);  %creating lead controller
G1lead = D*G1;              
T1 = feedback(G1lead,1);    %creating full transfer function with loop

figure(3);clf;rlocus(T1);zgrid([zeta],[])%plotting compensated root locus
xlim([-8,3]);ylim([-7,7]);  

stepT1 = 2*step(T1);        %creating a step input of T1
t = linspace(0,10,length(stepT1));
info = stepinfo(stepT1)
title('Compensated Root Locus')
figure(4);clf;plot(t,stepT1);grid on, grid minor
title('Step response for position of mass 2')
ylabel('Displacement (m)');xlabel('Time (s)')

%force
T2 = D*G2/(1+G1lead);
stepT2 = step(T2);
maxforce = max(step(T2))
minforce = min(step(T2))
t = linspace(0,10,length(step(T2)));
figure(5);clf
plot(t,stepT2);grid on;grid minor
title('Step response for force of actuator')
ylabel('Force (N)');xlabel('Time (s)')

%acceleration
T3 = D*G3/(1+G1lead);
stepT3 = step(T3);
maxaccel = max(step(T3))
minaccel = min(step(T3))
t = linspace(0,10,length(step(T3)));
figure(6);clf
plot(t,stepT3);grid on;grid minor;
title('Step response for acceleration on mass 2')
ylabel('Acceleration (m/s^2)');xlabel('Time (s)')
