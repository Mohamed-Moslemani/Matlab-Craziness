function AG = AG1D(cv,dv,ev)
    N = length(cv);

    % total nonzeros: 3*(N-2) interior + 2 boundaries
    nnz_total = 3*(N-2) + 2;

    I = zeros(nnz_total,1);
    J = zeros(nnz_total,1);
    val = zeros(nnz_total,1);

    index = 1;

    % interior points
    for i = 2:N-1
        I(index:index+2)= i;
        J(index)= i-1;
        J(index+1)= i;
        J(index+2)= i+1;
        val(index) = cv(i);
        val(index+1)= dv(i);
        val(index+2)= ev(i);
        index = index + 3;
    end

    % boundary rows
    I(index)= 1;  J(index)= 1;  val(index)= 1;
    I(index+1) = N;  J(index+1) = N;  val(index+1) = 1;

    % build sparse matrix
    AG = sparse(I,J,val,N,N);
end
