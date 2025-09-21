function orders = convergence_orders(hvals, errs)

    n = length(hvals);
    orders = NaN(n,1);  
    for k = 2:n
        ratio_err = errs(k-1) / errs(k);
        ratio_h= hvals(k-1) / hvals(k);
        orders(k) = log(ratio_err) / log(ratio_h);
    end
end
