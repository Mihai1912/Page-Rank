function [Q, R] = GSMod (X)
    [m n]=size(X);
    Q=zeros(m, n);
    R=zeros(n);
    for i = 1 : n
        R(i, i)=norm(X(:, i));
        Q(:, i)=(X(:, i))/R(i, i);
        for j = i+1:n
            R(i, j) = Q(:, i)' * X(:, j);
            X(:, j) = X(:, j) - Q(:, i) * R(i, j);
        endfor
    endfor
endfunction