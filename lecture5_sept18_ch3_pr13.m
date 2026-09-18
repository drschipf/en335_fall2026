% lecture 5, Chapter 3, problem 13 with answers
g_a = zeros(1,24);
g_a(5:6) = [1 1];
g_a(9:10) = g_a(5:6);
g_a(13:14) = g_a(5:6);
g_a(17:18) = g_a(5:6);
x = linspace(-4,20,length(g_a));
x_diff = linspace(-3,20,length(g_a)-1);
[FD] = diff(g_a);
BD = zeros(1,length(g_a));
z = zeros(1,length(g_a));
for i = 2:length(g_a)
    BD(i) = g_a(i) - g_a(i-1);
    % z(i) = cumsum(g_a(1:i));
end
z = cumsum(g_a);
figure(1)
stem(x,g_a)
title('g_n')
xlabel('n')
figure(4)
stem(x,z)
title('z')
xlabel('k')
% figure(2)
% stem(x_diff, FD)
% title('Forward Diff')
% xlabel('k')
% figure(3)
% stem(BD)
% title('Backard Diff')
% xlabel('k')