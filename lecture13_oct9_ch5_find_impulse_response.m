% Lecture 13, October 9th, find the impulse response
clear; close all;
impulse_response_ss = true;
impulse_response_tf = false;
impulse_response_dts = false;
impulse_response_example = false;
%% Find the impulse response from state space equations
% Requires a toolbox that we don't have currently (Signal Processing
% Toolbox)
if impulse_response_ss
    A = -4;
    B = 3;
    C = 1;
    D = 0;

    sys = ss(A, B, C, D);

    t = linspace(0, 3, 1000);
    h = impulse(sys, t);
end
%% Find the impulse response from the transfer function
% Requires a toolbox that we don't have currently (Signal Processing
% Toolbox)
if impulse_response_tf
    sys = tf(3, [1 4]);

    t = linspace(0, 3, 1000);
    h = impulse(sys, t);
end
%% Find the impulse response for discrete time systems
if impulse_response_dts
    a = [1 -0.6];
    b = [1];

    n = 0:30;
    delta = double(n == 0);

    h = filter(b, a, delta);
end
%% Example of discrete time system impulse response
if impulse_response_example
    % 3y[n] + 4y[n-1] + y[n-2] = g[n] + g[n-1]

    a = [3 4 1];   % Output coefficients of transfer function
    b = [1 1];     % Input coefficients of transfer function

    % indicies
    n = 0:30;

    % Unit impulse (kronecker delta function center at 0)
    g = double(n == 0);

    % Calculate impulse response with "filter" function
    h = filter(b, a, g);

end
if impulse_response_dts || impulse_response_example
    figure(1)
    stem(n, h, 'filled')
    xlabel('n')
    ylabel('h[n]')
    title('Discrete Time Impulse Response')
else
    figure(1)
    stem(t, h, 'filled')
    xlabel('t')
    ylabel('h(t)')
    title('Continuous Time Impulse Response')
end