%ppark

clear;clc

sys = tf([1 6 5],[4]);
figure(1);clf
rlocus(sys);hold on
zgrid([0.78],[]) 
