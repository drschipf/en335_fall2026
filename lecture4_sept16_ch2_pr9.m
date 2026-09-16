% Chapter 2, problem 9
t = linspace(-10,10,1000);
T = 4;
omega = 2*pi/T;
g1 = sin(omega*t);
g1(1:500) = zeros(1,length(g1(1:500)));
%unsolved variables
t0 = 0;
w = 1;
A = 1;
omega2_tau = w*(2*pi/4)*(t-t0);

g2 = A*sin(omega2_tau);
g2(omega2_tau < 0) = 0;

figure(1);
hold on
plot(t,g1,'k-')
plot(t,g2,'r--')
xlabel('t (s)')
grid on
ylabel('g1, g2')
legend('g1','g2')
set(findall(gcf,'-property','FontSize'),'FontSize',24)

%Solved variables
% t0 = 2;
% w = -2;
% omega2_tau = w*(2*pi/4)*(t-t0);
% A = 2;
% g2 = A*sin(omega2_tau);
% g2(omega2_tau < 0) = 0;