function [alpha,beta,f] = GetAB()
    u= @(x) (1+x).*sin(x);
    up = @(x) (1+x).*cos(x) + sin(x);
    upp = @(x) 2*cos(x) - (1+x).*sin(x);
    alpha = u(0);
    beta = u(1);
    a =@(X) 1+X.^2;
    b= @(X) (sin(X))^2;
    v= @(X) 0.01*X.^2;
    f = @(x) -(a(x).*upp(x)) + v(x).*up(x) + b(x).*u(x);

end;