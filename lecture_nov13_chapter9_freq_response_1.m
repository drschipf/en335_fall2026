% Signals and Systems lecture on November 13, 2026

% Define omega array
omega = linspace(-2*pi, 2*pi, 1000);
exp_omega = exp(1i*omega);

% Define poles and zeros
p1 = 1/2+1i*(1/2);
p2 = 1/2-1i*(1/2);
poles_z = [p1, p2];
zeros_z = []; % no zeros in this case
% If there was a zero at 1, zeros_z = [1]

% Create unit circle for stability concerns
theta = linspace(0, 2*pi, 200);
unit_circle = 1*exp(1i*theta);

%Define frequency response, with independent variable z
freq_response = @(z) 1./((z-p1).*(z-p2));

figure(1)
plot(omega,abs(freq_response(exp_omega)),'k-')
xlabel('\Omega')
ylabel('|H(e^{i\Omega})|')
title('Frequency Response Mag.')
set(findall(gcf,'-property','FontSize'),'FontSize',24)

figure(2)
hold on
axis equal
grid on
plot(real(unit_circle), imag(unit_circle), 'k--')
plot(real(poles_z), imag(poles_z), 'rx', ...
    'MarkerSize', 12, 'LineWidth', 2)
plot(real(zeros_z), imag(zeros_z), 'bo', ...
    'MarkerSize', 10, 'LineWidth', 2)
xlabel('Re')
ylabel('Im')
title('Z Plane')
xlim([-1.5, 1.5])
ylim([-1.5, 1.5])
set(findall(gcf,'-property','FontSize'),'FontSize',24)

