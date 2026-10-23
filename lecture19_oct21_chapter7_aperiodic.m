% Lecture 19, Oct 21, Chapter 7, Discrete Fourier Series and Transforms
close all; clear;

N = 10; % length of discrete time signal

% plot options
one_period = false;
zero_centered = false;
plot_DTFT = true;
plot_inverse = true;
% Display four periods in time domain
n_vec = 0:(N-1);
x = (0.5).^n_vec; %square pulse with duty cycle of 50%

% Extract one period for Fourier calculations
n = n_vec;
x_period = x;

% Centered frequency indices
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

% FFT of one period
if one_period
    if zero_centered
    gft = fftshift(fft(x_period));
    else
        gft = fft(x_period);
    end
else
    X_fft = fft(x_period);
    gft = X_fft(mod(k_vec,N)+1);
end

% DFT from definition
gft2 = zeros(1,length(k_vec));

% Analytical DFT after simplification in class
X_analytical = zeros(1,length(k_vec));

for ii = 1:length(k_vec)

    k = k_vec(ii);

    % % Analytical expression
    % if mod(k,N) == 0
    %     X_analytical(ii) = N/2;
    % else
    %     % Use the scaled Dirichlet function found in class
    %     X_analytical(ii) = exp(-1i*pi*k*(N/2-1)/N)*...
    %         sin(pi*k*(N/2)/N)/sin(pi*k/N);
    % end

    % DFS/DFT from complex exponential definition
    for ni = 1:N
        gft2(ii) = gft2(ii) + ...
            x_period(ni)*exp(-1i*2*pi*n(ni)*k/N);
    end

end

if plot_DTFT
k_fine = linspace(0,4*N,4000);
omega = 2*pi*k_fine/N;

X_dtft = zeros(size(omega));

for ni = 1:N
    X_dtft = X_dtft + ...
        x_period(ni)*exp(-1i*omega*n(ni));
end
if zero_centered
    X_dtft = fftshift(X_dtft);
    k_fine = linspace(-2*N,2*N,4000);
end
end

if plot_inverse

    % Reconstruct four periods
    n_vec_long = 0:4*N-1;

    x_long = zeros(size(n_vec_long));

    % Original aperiodic exponential extended in discrete time
    x_l = (0.5).^n_vec_long;

    % Inverse DFT
    for ii = 1:length(n_vec_long)

        n_val = n_vec_long(ii);

        for ki = 1:N

            k = k_vec(ki);

            x_long(ii) = x_long(ii) + ...
                gft2(ki)*exp(1i*2*pi*k*n_val/N);

        end

        % Normalize by original amount of samples
        x_long(ii) = x_long(ii)/N;

    end
end
% Plot results
figure(1);
subplot(2,1,1)
stem(n_vec,x,'LineWidth',2);
xlabel('n');
ylabel('x[n]');
title('Periodic Rectangular Pulse');
set(findall(gcf,'-property','FontSize'),'FontSize',24)
subplot(2,1,2)
hold on;
stem(k_vec,abs(gft),'LineWidth',2);
stem(k_vec,abs(gft2),'--','LineWidth',1.5);
% plot(k_vec,abs(X_analytical),'ro','LineWidth',2);
if plot_DTFT
plot(k_fine,abs(X_dtft),'k-','LineWidth',2);
end
legend('FFT','DFT Definition','DTFT');
xlabel('k (Frequency Index)');
ylabel('|X[k]|');
title('DFT Magnitude');
grid on
set(findall(gcf,'-property','FontSize'),'FontSize',24)

if plot_inverse
    figure(2);
    subplot(2,1,1)
    stem(n_vec_long,x_l,'LineWidth',2);
xlabel('n');
ylabel('x[n]');
set(findall(gcf,'-property','FontSize'),'FontSize',24)
    subplot(2,1,2)
    stem(n_vec_long,x_long,'LineWidth',2);
xlabel('n');
ylabel('x[n] from inverse');
set(findall(gcf,'-property','FontSize'),'FontSize',24)
end