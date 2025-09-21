h = 0.25;
[U,X,~] = Solve1D(h);
X   = X(:);                        % make column
uex = (1 - X).*sin(X);             % now column
err = U - uex;                     % works
disp([X U uex U-uex]);
