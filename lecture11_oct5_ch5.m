% Chapter 5, Impulse response and convolution
% make sure there are no remaining variables in the workspace, and no
% remaining plots
clear all; close all;

plot_convolution = false;
t = linspace(-2, 8, 2000);
tau = linspace(-2, 8, 2000);

dtau = tau(2)-tau(1);

g = @(t) exp(-t).*(t >= 0);
p = @(t) exp(-2*t).*(t >= 0);

y = zeros(1,length(t));
for ii = 1:length(t)

    y(ii) = 0;

    for jj = 1:length(tau)

        integrand = g(tau(jj))*p(t(ii)-tau(jj));
        y(ii) = y(ii) + integrand*dtau;

        if plot_convolution == true
            % Plot every few tau steps
            if mod(jj,5) == 0

                figure(2);

                subplot(4,1,1);
                plot(t, g(t), 'LineWidth', 2);
                hold on;
                xline(tau(jj),'--');
                ylabel('g(t)');

                subplot(4,1,2);
                plot(t, p(t), 'LineWidth', 2);
                hold on;
                xline(tau(jj),'--');
                ylabel('p(t)');

                subplot(4,1,3);
                plot(tau, p(t(ii)-tau), 'LineWidth', 2);
                hold on;
                xline(tau(jj),'--');
                ylabel('p(t-\tau)');
                title(['t = ',num2str(t(ii)), ...
                    ',  \tau = ',num2str(tau(jj))]);

                subplot(4,1,4); plot(t,y,'LineWidth',2);
                ylim([-0.1 1.0])
                ylabel('y(t)')
                xlabel('time (s)')
                hold on;

                drawnow;
                pause(0.5)
            end
        end
    end
end

%% Plot numerical and analytical solution side-by-side

y_analytical = (exp(-t) - exp(-2*t)).*(t >= 0);

figure(1);
plot(t,y,'LineWidth',2);
hold on;
plot(t,y_analytical,'--','LineWidth',2);
xlabel('t');
ylabel('y(t)');
legend('Numerical','Analytical');
