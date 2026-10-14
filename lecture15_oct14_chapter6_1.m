% Lecture 15, Oct 14, Chapter 6, Fourier Transforms
close all;
plot_gt_shifted = true;
tend = 1;
t_length = 1000;

% Time vector and sampling frequency
t = linspace(-tend,tend,t_length);
dt = t(2)-t(1); % Sampling period, also called Ts or deltaT in lecture
Fs = 1/dt; % Samping Frequency
% Parameters of square pulse
a = 1;
T = 0.5;
signal_case = 'square_pulse';
% 'positive_triangle', 'alternating_triangle',
% 'square', 'square_pulse'
b = 1; %meaningless for this signal
c = 1;

g = constructFunction(t,signal_case,T,a,b,c);
gt = g(t); %discrete sampling of square pulse continuous time function

% Calculate numerical Fast Fourier transform
gft = dt*fftshift(fft(ifftshift(gt)));

% Calculate Fourier transform using DFT definition from class
N = length(gt);
gft2 = zeros(1,N);

% Shift the time samples so t=0 corresponds to n=0
gt_shifted = ifftshift(gt);


for k = 0:N-1
    for n = 0:N-1
        gft2(k+1) = gft2(k+1) + gt_shifted(n+1)*exp(-1i*2*pi*n*k/N);
    end
end

% Frequency vector
f = (-t_length/2:t_length/2-1)*(Fs/t_length);

% Scale and shift the manually calculated DFT
if plot_gt_shifted
    figure(2)
    subplot(2,1,1)
    plot(t,gt_shifted,"LineWidth",3)
    title('Shifted Signal')
    ylabel('g(t)')
    xlabel('Time (s)')
    set(findall(gcf,'-property','FontSize'),'FontSize',24)
    subplot(2,1,2)
    plot(f,real(gft2),"LineWidth",3)
    xlabel('Frequency (Hz)')
    ylabel('Re\{G(f)\}')
    title('Shifted Signal')
    set(findall(gcf,'-property','FontSize'),'FontSize',24)
end
gft2 = dt*fftshift(gft2); %Shift DFT to center

% Plot Fourier transform
figure(1)
subplot(2,1,1)
plot(t,gt,"LineWidth",3)
ylabel('g(t)')
xlabel('Time (s)')
set(findall(gcf,'-property','FontSize'),'FontSize',24)
subplot(2,1,2)
hold on
plot(f,real(gft),"LineWidth",3)
plot(f,a*T*sin(pi*T*f)./(pi*T*f),'r--',"LineWidth",2)
legend('numerical', 'analytical')
xlabel('Frequency (Hz)')
ylabel('Re\{G(f)\}')
xlim([-20 20])
grid on
set(findall(gcf,'-property','FontSize'),'FontSize',24)
