Cerinta 1 :
	- Am citit din fisierul de input nr de pagini, pagnia, numarul de legaturi, si vectorul de legaturi
	- Am parcurs fiecare vector pe masura c eii citeam pentru a vedea daca pagina contine in ea o legatura 
	tot sprea ea insasi si daca, continea o stergeam
	- Am construit matricea de adiacenta
	- Am aplicat formula :
		V = (((1 - d)/n)*u)+(d*A*V_old);
		V este vectorul la pasul curent , iar V_old este V la pasul precedent


Cerinta 2 :
	- Am citit fisierul de input , si am creat matricea de adiacenta similar ca la cerinta 1 
	- Am aplicat formula :
		R = PR_Inv((I-d*A))*((1-d)/n)*u;

	- Pentru aflarea inversei se procedeaza astfel : 
		Se aplica algoritmul Gram-Schmidt modificat pe matricea A , se ia o matrice
		unitate de unde se extrage pe rand cate o coloana si se inmulteste aceasta 
		coloana cu transpusa lui Q si apoi se rezolva sistemul superior triunghiular
		si se concateneaza vectorul abtinut din rezolvarea sistemului la matricea
		rezultat.

Cerinta 3 :
	- Am citit fisierul de input , si am creat matricea de adiacenta similar ca la cerinta 1 
	- Se creaza matricea in care se pune pagina si porbabilitatea de intrare pe aceasta , si se sorteaza
	  descrescator
	- Se scrie in fisierul de output datele obtinute