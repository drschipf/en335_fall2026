% Lecture 6, September 21, Chapter 3, Problem 15
% Graph the accumulation g[n] of each oc these DTS which are zero for all
% times n<-16.
plot_answers = false;
n = -16:1:16;
% h_a = dirac(n);
h_a = zeros(1,length(n));
h_a(n==0) = 1;
h_b = heaviside(n);
h_c = cos(2*pi*n/16).*heaviside(n);

figure(1)
subplot(1,3,1);
stem(n,h_a)
ylim([-1.5 1.5])
xlabel('n')
ylabel('h[n]')
title('(a)')
subplot(1,3,2);
stem(n,h_b)
ylim([-1.5 1.5])
xlabel('n')
ylabel('h[n]')
title('(b)')
subplot(1,3,3);
stem(n,h_c)
ylim([-1.5 1.5])
xlabel('n')
ylabel('h[n]')
title('(c)')
set(findall(gcf,'-property','FontSize'),'FontSize',24)


if plot_answers == true
    figure(2)
    subplot(1,3,1);
    stem(n,cumsum(h_a))
    ylim([-1.5 1.5])
    xlabel('n')
    ylabel('g[n]')
    title('(a)')
    subplot(1,3,2);
    stem(n,cumsum(h_b))
    % ylim([-1.5 1.5])
    xlabel('n')
    ylabel('g[n]')
    title('(b)')
    subplot(1,3,3);
    stem(n,cumsum(h_c))
    % ylim([-1.5 1.5])
    xlabel('n')
    ylabel('g[n]')
    title('(c)')
    set(findall(gcf,'-property','FontSize'),'FontSize',24)
end