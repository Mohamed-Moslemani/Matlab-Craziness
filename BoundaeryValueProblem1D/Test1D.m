function R = Test1D()
    hvals = [1/4, 1/8, 1/16, 1/32];   % dyadic refinement

    % Preallocate result matrix
    R = zeros(length(hvals), 9);

    % Print header
    fprintf('------------------------------------------------------------------------------------------------------------\n');
    fprintf('    h       ||err||∞     order∞    ||err||N,2   orderN2    ||err||2     order2   ||err||2/||uex||2   cond(A)\n');
    fprintf('------------------------------------------------------------------------------------------------------------\n');

    prev_err_inf = NaN;
    prev_err_N2  = NaN;
    prev_err_2   = NaN;
    prev_h       = NaN;

    for k = 1:length(hvals)
        h = hvals(k);
        tic;

        % Solve system
        [U,X,condA] = Solve1D(h);
        X   = X(:);
        U   = U(:);
        uex = (1 - X).*sin(X);

        % Error vector
        err = U - uex;

        % Norms
        err_inf  = norm(err, inf);
        err_N_2  = norm(err, 2) / sqrt(length(X));
        err_2    = norm(err, 2);
        err_rel2 = err_2 / norm(uex, 2);
        elapsed  = toc;

        % Orders
        if k > 1
            order_inf = log(prev_err_inf/err_inf) / log(prev_h/h);
            order_N2  = log(prev_err_N2/err_N_2) / log(prev_h/h);
            order_2   = log(prev_err_2/err_2) / log(prev_h/h);
        else
            order_inf = NaN;
            order_N2  = NaN;
            order_2   = NaN;
        end

        % Save for next loop
        prev_err_inf = err_inf;
        prev_err_N2  = err_N_2;
        prev_err_2   = err_2;
        prev_h       = h;

        % Store row
        R(k,:) = [h, err_inf, order_inf, err_N_2, order_N2, err_2, order_2, err_rel2, condA];

        % Print row
        fprintf('%7.4f  %10.3e  %6.2f   %10.3e  %6.2f   %10.3e  %6.2f   %12.3e   %10.3e\n', ...
                h, err_inf, order_inf, err_N_2, order_N2, err_2, order_2, err_rel2, condA);
    end

    fprintf('------------------------------------------------------------------------------------------------------------\n');
end
