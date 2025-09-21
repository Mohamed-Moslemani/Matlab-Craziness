function R = Test1D()
    hvals = [1/4, 1/8, 1/10, 1/16, 1/20];
    n = length(hvals);

    % result matrix: h, cond(A), err∞, order∞, errN2, orderN2, err2, order2, err2/uex2, time
    R = NaN(n, 10);

    % Store raw errors for order computation
    err_inf_all = zeros(n,1);
    err_N2_all  = zeros(n,1);
    err_2_all   = zeros(n,1);

    for k=1:n
        h = hvals(k);
        tic;
        [U,X,condA] = Solve1D(h);
        elapsed = toc;

        % Exact solution
        uex = (1+X).*sin(X);
        err = uex(:) - U(:);

        % Norms
        err_inf = norm(err, inf);
        err_N2  = norm(err, 2)/sqrt(length(X));
        err_2   = norm(err, 2);

        % Store errors
        err_inf_all(k) = err_inf;
        err_N2_all(k)  = err_N2;
        err_2_all(k)   = err_2;

        % Fill row temporarily (orders NaN for now)
        R(k,:) = [h, condA, err_inf, NaN, err_N2, NaN, err_2, NaN, err_2/norm(uex,2), elapsed];
    end

    % Compute orders
    order_inf = convergence_orders(hvals, err_inf_all);
    order_N2  = convergence_orders(hvals, err_N2_all);
    order_2   = convergence_orders(hvals, err_2_all);

    % Insert orders into R
    R(:,4) = order_inf;
    R(:,6) = order_N2;
    R(:,8) = order_2;

    % Print table
    fprintf('---------------------------------------------------------------------------------------------------------------------------\n');
    fprintf('   h       cond(A)    ||err||∞   order∞    ||err||N2   orderN2   ||err||2   order2   ||err||2/||uex||2   Time\n');
    fprintf('---------------------------------------------------------------------------------------------------------------------------\n');
    disp(R);
end


