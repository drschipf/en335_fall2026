function [] = twoFreqPlot(~)
x = linspace(0, 10, 1000);
y = cos(4*x);
y(100:300) = sin(16*x(100:300));
figure(2); plot(x,y)
f1 = 16/(2*pi);
fprintf('first frequency is f1 = %d\n', 'f1');
fprintf('first frequency is f2 = %d\n', 'f2');
end

function [] = oneFreqPlot(~)
x = linspace(0, 10, 1000);
y = cos(4*x);
%y(100:300) = sin(16*x(100:300));
figure(1); plot(x,y)
f1 = 16/(2*pi);
fprintf('first frequency is f1 = %d\n', 'f1');
fprintf('first frequency is f2 = %d\n', 'f2');
end

twoFreqPlot()
oneFreqPlot()