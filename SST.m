function X = SST (A , b)
    %Se rezolva sistemul superior triunghiular
    [n n] = size(A);
    X = zeros(n, 1);
    for i = n :-1: 1 
        X(i) = (b(i) - A(i,i+1:n) * X (i+1:n)) / A(i,i);
    endfor
endfunction
