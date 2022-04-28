function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se aplica algoritmul Gram-Schmidt modificat pe matricea A , se ia o matrice
  % unitate de unde se extrage pe rand cate o coloana si se inmulteste aceasta 
  % coloana cu transpusa lui Q si apoi se rezolva sistemul superior triunghiular
  % si se concateneaza vectorul abtinut din rezolvarea sistemului la matricea
  % rezultat 
    n = size(A);
    AUX = zeros(n);
    [Q R] = GSMod(A);
    I = eye(n);
    for j = 1 : n
        i = I(:,j);
        tmp = Q' * i;
        a = SST(R , tmp);
        for k = 1 : n
            AUX(k,j) = a(k,1);
        endfor
    endfor
    B=AUX;
endfunction