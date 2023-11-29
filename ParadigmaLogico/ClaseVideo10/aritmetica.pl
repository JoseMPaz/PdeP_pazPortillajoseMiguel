% siguiente(Anterior,Siguiente)
% El is es inversible a izquierda, es decir siguiente, 
% pero is no es inversible a derecha.
% El + no es inversible, por ende Anterior debe venir ligado, 
% El 1 ya es un numero, por ende el + lo reconoce.
siguiente(Anterior,Siguiente):-
	% Como el predicado numero es inversible, liga Anterior para hacer al predicado siguiente inversible
	numero(Anterior), 
	Siguiente is Anterior + 1.

% El predicado numero es inversible ya que between lo es.	
numero(Numero):-
	between(0,100,Numero).
