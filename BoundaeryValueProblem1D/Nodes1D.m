function [X,T] = Nodes1D(L0,h,L)
    X= L0:h:L;
    N= length(X);
    T= zeros(N,1);
    T(1)=1;
    T(N)=1;
end;

