% Chapter 2, Problem 47 (without an answer)
t = linspace(0,4,1000);
g = zeros(1,length(t));
N = 100;
T0 = max(t)/16;
omega0 = 2*pi/T0;
t0 = 8*pi/omega0;
for n = 0:N
    g = g + (-1)^n*heaviside(t-n*t0)+(-1)^(n+1)*heaviside(t-(n+1)*t0);
end
x = sin(omega0*t).*g;
%x = sin(omega0*t);

figure(1)
plot(t,x,'k-')
xlabel('t (ms)')
ylabel('x(t)')
ylim([-1.5 1.5])
grid on
title('BPSK Signal')
set(findall(gcf,'-property','FontSize'),'FontSize',24)
