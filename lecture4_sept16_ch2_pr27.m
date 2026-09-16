% lecture4, chapter 2, problem 27 (without answers)
t = linspace(0,4*2,1000);
% Sampling interval and sampling frequency
dt = t(2) - t(1);
Fs = 1/dt;
x1 = cos(2*pi*t);
x2 = sin(3*pi*t);
x3 = cos(5*pi*t-3*pi/4);
x = x1 + x2 + x3;
% Autocorrelation
[C,lags] = xcorr(x,'coeff');

% Convert lag from samples to seconds
tau = lags/Fs;

figure(1);
subplot(1,2,1)
plot(t,x)
xlabel('time (s)')
ylabel('x')
subplot(1,2,2)
plot(tau,C)
xlim([0 6])
xlabel('Time lab (s)')
ylabel('Autocorrelation of x')
% Mark the expected fundamental period
xline(2,'--')
set(findall(gcf,'-property','FontSize'),'FontSize',24)