%ppark

clear all; clc;

% Constants

m1=1;
m2=0.5;
b1=0.5;
k1=5;
k2=3;

blist=[0 1 5];

titles=['No damping                     ';...
        'Underdamped                    ';...
        'Overdamped                     '];
titles2=cellstr(titles);
    
for i=1:3
    
    b=blist(i);

% Create A, B, C, and D matrices.

A = [0 1 0 0; -k1/m1 -b1/m1 k2/m1 0; 0 -1 0 1; 0 0 -k2/m2 0];
B = [0; 1/m1; 0; 0];
C = [1 0 0 0];
D = 0;    
    
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

time = linspace(0,10,1000);

% Evaluate the outputs using the 'impulse' function in MATLAB
% This means that MATLAB puts in u(s) = 1
% MATLAB assumes zero initial conditions.
% If the applied impulse has magnitude not equal to 1,
% we need to scale the impulse response by simply multiplying.

y1 = 1*impulse(sys_ss,time);

% Evaluate the outputs using the 'step' function in MATLAB
% This means that MATLAB puts in u(s) = 1/s,
% MATLAB assumes zero initial conditions.
% If the applied force has magnitude not equal to 1,
% we need to scale the step response by simply multiplying.

y2 = 1*step(sys_ss,time);


% Plot the two outputs

figure(3*i-2); clf;
plot(time,y1(:,1),time,y2(:,1)); hold all;
grid on
xlabel('t [s]'); ylabel('x(t) [m]');
legend('impulse','step','Location','E');
title(titles2(i))

figure(3*i-1); clf;
pzmap(sys_ss)
xlim([-4 4])
ylim([-2.5 2.5])

figure(3*i); clf;
bode(sys_ss)
   
% Find step-response details for the underdamped system.
if    i==2
  stepdata = stepinfo(sys_ss)
else
    
end

end

% Compare different zeta (0.5,1,1.25)

time = linspace(0,10,1000);

y3(:,1)=exp(-0.5*time).*sin(time);
y3(:,2)=time.*exp(-time);
y3(:,3)=0.67*(exp(-0.5*time)-exp(-2*time));

figure(10); clf;
plot(time,y3(:,1)); hold all;
plot(time,y3(:,2)); hold all;
plot(time,y3(:,3)); hold all;
legend('under','crit','over','Location','NE');

% Step-response details for 
