function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
    R1 = Iterative(nume , d , eps);
    R2 = Algebraic(nume , d , eps);

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
    val1 = fscanf(ptr , "%f" , [1 , 1]);
    val2 = fscanf(ptr , "%f" , [1 , 1]);
    
    M = zeros(n , 1);
    
    % se craeza un vector al paginilor cu probabilitatile de a intra pe pagina
    % respectiva 
    for m = 1 : n
        y = Apartenenta(R2(m) , val1 , val2);
        M(m , 1) = y;
    endfor
 
    % se creaza matricea in care se pune pagina si porbabilitatea de intrare pe
    % aceasta
    matr_cr2 = zeros(n,2);
    for u = 1 : n
        matr_cr2(u,1) = u;
        matr_cr2(u,2) = M(u,1);
    endfor
    % se sorteaza matricea descrescator in fuctie de a doua coloana (se creaza
    % clasamentul paginilor )
    matr_cr2 = sortrows(matr_cr2 , [-2 , 2]);
 
    % se scrie in fisierul de output datele obtinute
    if (strcmp(nume , "graf1") == 1) 
        output_name = "graf1.out";
    endif
    if (strcmp(nume , "graf2") == 1) 
        output_name = "graf2.out";
    endif
 
    output = fopen(output_name , 'w');

    fdisp(output , n);
    for j = 1 : n
        fprintf(output , "%5.6f\n" , R1(j,1));
    endfor
    fprintf(output , "\n");
    for j = 1 : n
        fprintf(output , "%5.6f\n" , R2(j,1));
    endfor
    fprintf(output , "\n");

    for i = 1 : n
        fprintf(output , "%d " , i);
        fprintf(output , "%d " , matr_cr2(i , 1));
        fprintf(output , "%5.6f\n" , matr_cr2(i , 2));
    endfor
 
    fclose(ptr);
    fclose(output);
endfunction