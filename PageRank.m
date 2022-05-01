function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out
    R1 = Iterative(nume , d , eps);
    R2 = Algebraic(nume , d , eps);

    %R2 = flip(sort(R2));
   
    
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
    
    % se creaza o matrice cu valorile obtinute prin metroda algebraica si
    % indexurile paginilor , iar apoi se sorteaza descrescator
    Ap = zeros(n ,2);
    for w = 1 : n
      Ap(w , 1) = w;
      Ap(w , 2) = R2(w , 1);
    endfor
    
    for i = 1 : n-1
      for j = i+1 : n
        if (Ap(i , 2) < Ap(j , 2))
          [Ap(i , 2) , Ap(j , 2)] = swap(Ap(i , 2) , Ap(j , 2));
          [Ap(i , 1) , Ap(j , 1)] = swap(Ap(i , 1) , Ap(j , 1));
        endif
      endfor
    endfor
    
    % se creaza un vector al paginilor cu probabilitatile de a intra pe pagina
    % respectiva 
    for m = 1 : n
        Ap(m , 2) = Apartenenta(Ap(m , 2) , val1 , val2);
    endfor
 
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
        fprintf(output , "%d " , Ap(i , 1));
        fprintf(output , "%5.6f\n" , Ap(i , 2));
    endfor
 
    fclose(ptr);
    fclose(output);
endfunction