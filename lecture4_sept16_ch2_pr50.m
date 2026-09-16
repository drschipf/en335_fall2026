% lecture 4, Chapter 2, problem 50 without answers
t = linspace(-9*1.5,9*3.5, 10000);
A = 3;
omega0 = 2*pi/18;
%x1 = cos(omega0*t);
%x = x1.^2;
x = zeros(1,length(t));
T = 9*1.5;
R = T/2;
N = 10;
B = 3;
for n = -N:N
    tau = (t-n*T);
    x= x + sqrt(R^2-tau.^2);
end


figure(1)
plot(t,x)
xlim([-9*1.5 9*1.5])
ylim([-9*1.5 9*1.5])
axis equal
set(findall(gcf,'-property','FontSize'),'FontSize',24)