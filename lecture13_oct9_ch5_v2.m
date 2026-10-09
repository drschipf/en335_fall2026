% lecture 13, Response given an impulse response and excitation
clear all; close all;
% Let h(t) = a*exp(-b*t)u(t)
% g(t) = rect(c*(t-d))
check_stability = true;
a = 3; b = 4;
c = 1/5; d = 1/4;

% y(t) = g(t) * h(t)
plot_convolution = false;
t = linspace(-2, 8, 2000);
tau = linspace(-2, 8, 2000);

dtau = tau(2)-tau(1);

g = @(t) double(abs(c*(t-d)) <= 0.5);
h = @(t) a*exp(-b*t).*(t >= 0);

figure(1)
subplot(2,1,1)
plot(t,g(t))
title('Excitation')
ylabel('y')
xlabel('t')
subplot(2,1,2)
plot(t,h(t))
title('Impulse Response')
ylabel('y')
xlabel('t')

% Calculate the convolution with conv()
y_conv = conv(g(tau), h(tau), 'full') * dtau;
% The convolution requires a longer time vector
t_conv = linspace(2*tau(1), 2*tau(end), length(y_conv));

y = zeros(1,length(t));
for ii = 1:length(t)

    y(ii) = trapz(tau,g(tau).*h(t(ii)-tau));

    % for jj = 1:length(tau)
    % 
    %     integrand = g(tau(jj))*h(t(ii)-tau(jj));
    %     y(ii) = y(ii) + integrand*dtau;
    % 
    % end
end

figure(2)
hold on
plot(t,y,'k')
plot(t_conv,y_conv,'r--')
ylabel('y')
xlabel('t')

if check_stability
% Numerical BIBO stability check by calculating the trapz at different
% lengths of time
T_upper = [0.1, 0.5, 1, 2, 5, 10, 20];
I = zeros(size(T_upper));

for k = 1:length(T_upper)
    t_s = linspace(0, T_upper(k), 10000);
    I(k) = trapz(t_s, abs(h(t_s)));
end

figure(3)
plot(T_upper, I, 'k')
xlabel('Integration upper limit T (s)')
ylabel('Integral of |h(t)|')
grid on
end
