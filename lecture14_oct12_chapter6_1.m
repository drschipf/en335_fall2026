% lecture 14, oct12, chapter 6, Fourier Series
clear all; close all;
tend = 1;
N = 10;
t_length = 5000;
t = linspace(-tend, tend, t_length);
a = 1;
T = 0.5;
signal_case = 'alternating_triangle';
%'positive_triangle', 'alternating_triangle', 'square'
% g = @(t) a*max(1-abs(t)/T0, 0);
switch signal_case
    case 'positive_triangle'
        T0 = 2*T;
        t_shift = 0.0;
        g = @(t) a*max(1-abs(mod(t-t_shift+T/2,T)-T/2)/T0, 0);
        T_FS = T;
    case 'alternating_triangle'
        t_shift = 0.25;
        T0 = T/2;

        g = @(t) a*max(1-abs(mod(t-t_shift+T/2,T)-T/2)/T0, 0) ...
            .* (-1).^floor((t-t_shift+T/2)/T);
        T_FS = 2*T;
    case 'square'
        T0 = T/2;        % Pulse width
        t_shift = 0.0;

        g = @(t) a*double(abs(mod(t-t_shift+T/2,T)-T/2) < T0/2);
        T_FS = T;
    otherwise
        error('not set-up yet\n')
end

% Plot the periodic signal
figure(1)
plot(t,g(t))
title('a*sinc(b*t) vs. t')
ylabel('g')
xlabel('t')

% Find the coefficients of the Fourier Series
delta_t = t(2)-t(1);
N_period = round(T_FS/delta_t);
ts = linspace(-T_FS/2,T_FS/2,1000);
c0 = (1/T_FS)*trapz(ts,g(ts));
% Calculate the Fourier Series to N terms
y = c0*ones(1,t_length);
%cn = zeros(1,N);
ii=1;
n_vec = -N:N;
cn_vec = zeros(length(n_vec));
for n=-N:N
    if n~=0
        cn = (1/T_FS)*trapz(ts,g(ts).*exp(-1i*2*pi*n*ts/T_FS));
        y = y + cn.*exp(1i*2*pi*n*t/T_FS);
        cn_vec(ii) = cn;
    else
        cn_vec(ii) = c0;
    end
    ii = ii+1;
end

% Plot the periodic signal
figure(1)
subplot(3,1,1)
plot(t,g(t),'k-')
title('a*sinc(b*t) vs. t')
ylabel('g')
xlabel('t')
hold on
plot(t,real(y),'r--')
legend('g(t)','Fourier')
subplot(3,1,2)
stem(n_vec,real(cn_vec),'k')
% title('a*sinc(b*t) vs. t')
ylabel('n')
xlabel('Re\{c_n\}')
subplot(3,1,3)
stem(n_vec,imag(cn_vec),'k')
title('a*sinc(b*t) vs. t')
ylabel('g')
xlabel('Im\{c_n\}')
set(findall(gcf,'-property','FontSize'),'FontSize',24)
