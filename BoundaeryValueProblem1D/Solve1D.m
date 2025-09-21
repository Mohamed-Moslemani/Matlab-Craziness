function [U,X,condA] = Solve1D(h)
    [X,T] = Nodes1D(0,h,1);
    N= length(X);
    [alpha,beta,f]= GetAB();
    cv= zeros(N,1);
    dv= zeros(N,1);
    ev= zeros(N,1);
    for i = 2:N-1
        a = 1+X(i)^2;
        b= (sin(X(i)))^2;
        v= 0.01*X(i)^2;
    cv(i) = -(a/h^2 + v/(2*h));
    dv(i) = (2*a/h^2 + b);
    ev(i) = (v/(2*h) - a/h^2);

    end;
    Ag= AG1D(cv,dv,ev);
    F= zeros(N,1);
    for i = 2:N-1
        F(i)= f(X(i));
    end;
    F(1)= alpha;
    F(N)= beta;
    condA= condest(Ag);
    U= Ag\F;
    X= X;
end