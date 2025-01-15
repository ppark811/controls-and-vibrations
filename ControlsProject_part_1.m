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
t = linspace(0,5,1000); %Creating vector of time (for plotting)

figure(1); clf; pzmap(G1)   %plotting poles and zeros on pzmap

%---Step Response---%

figure(2); clf; step(G1,t); title('Step Response of Position of m_2')       %plotting step response of X2(s)
figure(3); clf; step(G2,t); title('Step Response of Force on actuator')     %plotting step respons of Fin
figure(4); clf; step(G3,t); title('Step Response of Acceleration of m_2')   %Plotting step response of A2(s)
