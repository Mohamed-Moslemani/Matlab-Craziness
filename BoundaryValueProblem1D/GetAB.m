function [alpha,beta,f] = GetAB()
    u   = @(x) (1+x).*sin(x);
    up  = @(x) (1+x).*cos(x) + sin(x);
    upp = @(x) 2*cos(x) - (1+x).*sin(x);

    alpha = u(0);
    beta  = u(1);

    a = @(x) 1 + x.^2;
    b = @(x) (sin(x)).^2;
    v = @(x) 0.01*x.^2;

    f = @(x) -(a(x).*upp(x)) + v(x).*up(x) + b(x).*u(x);
end
