function [varargout] = constructFunction(varargin)
if ~isempty(varargin)
    %we have inputs to this function
    t = varargin{1};
    func_name = varargin{2};
    if length(varargin)>2
        T = varargin{3};
        a = varargin{4};
        b = varargin{5};
        c = varargin{6};
    end
else
    %run as script
    tend = 1;
    t_length = 5000;
    t = linspace(-tend, tend, t_length);
    T = 0.5;
    func_name = 'square_pulse';%'positive_triangle'
    a = 1;

end
switch func_name
    case 'positive_triangle'
        T0 = 2*T;
        t_shift = 0.0;
        g = @(t) a*max(1-abs(mod(t-t_shift+T/2,T)-T/2)/T0, 0);
        T_FS = T;
    case 'square_pulse'
        T0 = 2*T;
        t_shift = 0.0;
        g = @(t) a*double(abs(t)<T/2);
        T_FS = T;
    otherwise
        error('no function defined\n')
end

if length(varargin)>0
    varargout{1} = g;
else
    varargout = {0};
    % Plot the periodic signal
    figure(1)
    plot(t,g(t))
    title('Periodic triangular signal')
    ylabel('g')
    xlabel('t')
end