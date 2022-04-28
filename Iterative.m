function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
    ptr = fopen(nume);
    n = fscanf(ptr , "%d" , [1 , 1]);
    A = zeros(n);
    for i = 1 : n
        pg = fscanf (ptr , "%d" , [1 , 1]);
        nr_leg = fscanf(ptr , "%d" , [1 , 1]);
        vect_leg = fscanf(ptr , "%d" , [1 , nr_leg]);
        num = nr_leg;
        % se parcurge vectorul de legaturi pt a verifica daca pagina are 
        % are legarui cu ea insasi si se elimina acestea
        for k = 1 : nr_leg
            if (vect_leg(1 , k) == pg)
            num--;
            endif
        endfor
        % se creaza matricea de adiacenta
        for j = 1 : nr_leg
            if (vect_leg(1 , j) != i)
            aux = vect_leg(1 , j);
            A(aux , i) = 1/num;
            endif
        endfor
    endfor
    V = ones(n, 1);
    V ./= n;
    u = ones(n, 1);
    while 1
        V_old = V;
        V = (((1 - d)/n)*u)+(d*A*V_old);
        err = norm(V - V_old);
        if (err < eps)
            break
        endif
    endwhile
    R=V;
endfunction
