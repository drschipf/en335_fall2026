% Signals and Systems lecture on November 13, 2026
omega = linspace(-2*pi, 2*pi, 1000);
p1 = 1/2+1i*(1/2);
p2 = 1/2-1i*(1/2);
freq_response = @(z) 1./((z-p1).*(z-p2));

exp_omega = exp(1i*omega);

figure(1)
plot(omega,abs(freq_response(exp_omega)),'k-')
xlabel('\Omega')
ylabel('|H(e^{i\Omega})|')
set(findall(gcf,'-property','FontSize'),'FontSize',24)
