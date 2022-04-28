function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
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
    I = eye(n);
    u = ones(n , 1);
    R = PR_Inv((I-d*A))*((1-d)/n)*u;
endfunction