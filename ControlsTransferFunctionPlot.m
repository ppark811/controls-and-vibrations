%ppark
clear;clc

%-----1 part b-----%

sys=tf([10 30], [1 7 24 43 55 30])
pole(sys)

%-----3 part e-----%
k=400;
sys=tf([0.4*400], [1 1.6 0.4*400])
pole(sys)
