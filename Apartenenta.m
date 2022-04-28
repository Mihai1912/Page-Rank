function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1
    if ((x >= 0) && (x < val1)) 
        rez = 0;
    endif
    if ((x > val2) && (x <=1))
        rez = 1;
    endif
    if ((x >= val1) && (x <= val2))
        a = 1 / (val2 - val1);
        b = - val1 / (val2 - val1);
        rez = a * x + b;
    endif
    y=rez;
endfunction