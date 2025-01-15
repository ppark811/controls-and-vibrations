%ppark

%-----Part B-----%

sys1 = tf([0.4],[1 1.6]);
figure(1);clf
rlocus(sys1)

sys2 = tf([0.4],[1 1.6 0]);
figure(2);clf
rlocus(sys2)

sys3 = tf([0.4 0.4],[1 1.6 0]);
figure(3);clf
rlocus(sys3)
