function [U,X,condA] = Solve1DV2(h)
    % Mesh
    [X,T] = Nodes1DV2(0,h,1);
    N = length(X);

    a= @(x) 1 + x.^2;
    ap = @(x) 2*x;
    b= @(x) sin(x).^2;
    v = @(x) 0.01*x.^2;
    vp = @(x) 0.02*x;
    u= @(x)(1+x).*sin(x);
    up = @(x) sin(x) + (1+x).*cos(x);
    upp= @(x) 2*cos(x) - (1+x).*sin(x);

    f= @(x) - ap(x).*up(x) - a(x).*upp(x) - vp(x).*u(x) - v(x).*up(x) + b(x).*u(x);

    alpha = u(0);
    beta  = u(1);

    cv = zeros(N,1);
    dv = zeros(N,1);
    ev = zeros(N,1);

    for i = 2:N-1
    xi = X(i);
    cv(i) = -(a(xi)/h^2) + (ap(xi)+v(xi))/(2*h);
    dv(i) =  (2*a(xi)/h^2 + b(xi));
    ev(i) = -(a(xi)/h^2) - (ap(xi)+v(xi))/(2*h);

    end




    F = f(X(:));
    F(2) = F(2) - cv(2)*alpha;
    F(N-1) = F(N-1) - ev(N-1)*beta;

    AG = AG1DV2(cv,dv,ev);

    IUK = 2:N-1;
    IK= [1 N];
    A = AG(IUK,IUK);
    rhs= F(IUK);

    Z= A\rhs;
    U = zeros(N,1);
    U(1)= alpha;
    U(N) = beta;
    U(2:N-1) = Z;

    condA = cond(A);
end
