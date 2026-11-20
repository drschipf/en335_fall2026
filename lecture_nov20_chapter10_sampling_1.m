% Signals and Systems lecture on November 20, 2026

% Define omega array
T0 = 1;
t = linspace(0, 4*T0, 1000);
M = 256;
t_one = (0:M-1)*T0/M;

Ts = (1/18)*(1/2);
N = T0/Ts; 
zero_centered = false;
plot_DTFT = true;
one_period = false;

if one_period
    if zero_centered
        k_vec = -N/2:N/2-1;
    else
        k_vec = 0:(N-1);
    end
else
    if zero_centered
        k_vec = -N*2:(2*N-1);
    else
        k_vec = 0:(4*N-1);
    end
end

%Define frequency response, with independent variable z
f1 = 1; f2 = 8;
x = @(t) 5*cos(2*pi*f1*t).*cos(2*pi*f2*t);

xs = zeros(1,N);
narray = zeros(1,N);
for n = 0:N-1
    xs(n+1) = x(n*Ts);
    narray(n+1) = n;
end

if one_period
    if zero_centered
    gft = fftshift(fft(x_period))/M;
    else
        gft = fft(x_period);
    end
else
    x_period = x(t_one);
    X_fft = fft(x_period)/M;
    gft = fftshift(X_fft);
    %gft = X_fft(mod(k_vec,N)+1);
end

k_original_signal = -M/2:M/2-1;
f_original_signal = k_original_signal/T0;


figure(1)
hold on
plot(t,x(t),'k-')
xlabel('t')
ylabel('x(t)')
xlim([0 narray(end)*Ts])
set(findall(gcf,'-property','FontSize'),'FontSize',24)
plot(narray*Ts,xs,'ro')
xlabel('n')
ylabel('x_s[n]')
set(findall(gcf,'-property','FontSize'),'FontSize',24)

figure(2)
subplot(2,1,1)
plot(t,x(t),'k-')
xlabel('t')
ylabel('x(t)')
%xlim([0 narray(end)*Ts])
set(findall(gcf,'-property','FontSize'),'FontSize',24)
subplot(2,1,2)
hold on
plot(f_original_signal,abs(gft))
xlabel('f (Hz)')
ylabel('|X(f)|')
set(findall(gcf,'-property','FontSize'),'FontSize',24)


