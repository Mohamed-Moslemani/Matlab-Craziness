
function AG = AG1DV2(cv,dv,ev)

    N= length(cv);

    nnz_total = 3*(N-2) + 2;

    I= zeros(nnz_total,1);
    J= zeros(nnz_total,1);
    val = zeros(nnz_total,1);

    idx = 1;

    for i = 2:N-1
        I(idx)= i; J(idx)= i-1; val(idx)= cv(i);
        I(idx+1) = i; J(idx+1)= i;   val(idx+1) = dv(i);
        I(idx+2)= i; J(idx+2) = i+1; val(idx+2) = ev(i);
        idx = idx + 3;
    end

    I(idx)= 1; J(idx)= 1; val(idx)= 1;
    I(idx+1) = N; J(idx+1) = N; val(idx+1) = 1;

    AG = sparse(I,J,val,N,N);
end
