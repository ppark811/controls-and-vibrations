%ppark

clear all; clc;

% Constants
kt = 200;
J = 0.2;
km = 20;
Rm = 5;
Lm = .1;
Rl = 100;



% Create A, B, C, and D matrices.

A = [0 -1 0; kt/J 0 -km/J; 0 km/Lm -(Rm+Rl)/Lm];
B = [1; 0; 0];
C = [0 0 Rl];
D = [0];    
    
% Create state-space dynamic model in MATLAB
% This performs the inverse laplace transform and finds the output y(t)

sys_ss = ss(A,B,C,D);

% Create transfer functions
% We will not need to use the transfer function, ss does everything,
% but it is good to look at it to see how difficult life would be!

sys_tf = tf(sys_ss)

% Find poles

p=pole(sys_tf)

% Create a list of times at which to evaluate the outputs

time = linspace(0,5,1000);

% Evaluate the outputs using the 'impulse' function in MATLAB
% This means that MATLAB puts in u(s) = 1
% MATLAB assumes zero initial conditions.
% If the applied impulse has magnitude not equal to 1,
% we need to scale the impulse response by simply multiplying.



% Evaluate the outputs using the 'step' function in MATLAB
% This means that MATLAB puts in u(s) = 1/s,
% MATLAB assumes zero initial conditions.
% If the applied force has magnitude not equal to 1,
% we need to scale the step response by simply multiplying.

y1 = 1*step(sys_ss,time);

% Plot the two outputs

plot(time,y1(:,1)); hold all;
grid on
xlabel('t [s]'); ylabel('x(t) [m]');
legend('step','Location','E');
