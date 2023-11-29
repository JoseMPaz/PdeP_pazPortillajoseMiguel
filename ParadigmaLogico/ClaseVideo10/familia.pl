% padre(Padre,Hijo)
padre(homero,bart).
padre(homero,lisa).
padre(homero,maggi).
padre(abraham,homero).

% abuelo(Abuelo,Nieto)
abuelo(Abuelo,Nieto):-
	padre(Padre,Nieto),
	padre(Abuelo,Padre).
% Fry es su propio abuelo.
abuelo(fry,fry).

% hermano(UnHermano,OtroHermano)
hermano(UnHermano,OtroHermano):-
	padre(Padre,UnHermano),
	padre(Padre,OtroHermano),
	UnHermano \= OtroHermano.

% Alguien es ancestro de un descendiente si es su padre, abuelo, bisabuelo, ...
% ancestro(Ancestro,Descendiente)
ancestro(Ancestro,Descendiente):-
	padre(Ancestro,Descendiente).
ancestro(Ancestro,Descendiente):-
	padre(Ancestro,Alguien),
	ancestro(Alguien,Descendiente).




