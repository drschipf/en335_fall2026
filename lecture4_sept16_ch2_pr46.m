% Chapter 2, Problem 46 (without an answer)
t = linspace(-10,60,1000);
A1 = -10;
x1 = A1*heaviside(t);
x2 = -A1*heaviside(t-5);
x = x1+x2;
% g = zeros(1,length(t));
% N = 100;
% T0 = max(t)/16;
% omega0 = 2*pi/T0;
% t0 = 8*pi/omega0;
% for n = 0:N
%     g = g + (-1)^n*heaviside(t-n*t0)+(-1)^(n+1)*heaviside(t-(n+1)*t0);
% end
% x = sin(omega0*t).*g;
%x = sin(omega0*t);

figure(1)
plot(t,x,'k-')
xlabel('t (\mu s)')
ylabel('x(t)')
ylim([-12 2])
grid on
title('Television Signal')
set(findall(gcf,'-property','FontSize'),'FontSize',24)