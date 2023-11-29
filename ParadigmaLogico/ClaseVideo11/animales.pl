% habitat(Animal,Bioma)
% El predicado habitat es inversible porque permite hacer consultas existenciales.
habitat(jirafa,sabana).
habitat(tigre,sabana).
habitat(tigre,bosque).
habitat(tiburon,mar).

acuatico(Animal):-
	habitat(Animal,mar).

terrestre(Animal):-
	% Para volverlo inversible
	habitat(Animal,_),
	not(habitat(Animal,mar)).


templado(Bioma):-
	habitat(_,Bioma),
	Bioma == sabana.
templado(Bioma):-
	habitat(_,Bioma),
	Bioma == bosque.

friolento(Animal):-
	habitat(Animal,_),
	forall(habitat(Animal,Bioma),templado(Bioma)).
	
% come (Depredador,Presa)
come(tigre,jirafa).
come(tigre,tiburon).

% hostil/2 relaciona un animal con un bioma, si todos los animales que viven ahi se lo comen.
hostil(Animal,Bioma):-
	habitat(Animal,_),
	habitat(_,Bioma),
	forall(habitat(OtroAnimal,Bioma),come(OtroAnimal,Animal)).
	
% terrible/2 relaciona un animal con un bioma si todos los animales que se lo comen, habitan en el bioma.
terrible(Animal,Bioma):-
	habitat(Animal,_),
	habitat(_,Bioma),
	forall(come(OtroAnimal,Animal),habitat(OtroAnimal,Bioma)).
	
% compatibles/2 relaciona dos animales si ninguno de los dos come al otro
compatibles(UnAnimal,OtroAnimal):-
	habitat(UnAnimal,_),
	habitat(OtroAnimal,_),
	not(come(UnAnimal,OtroAnimal)),
	not(come(OtroAnimal,UnAnimal)).
	
% adaptable/1 se cumple para los animales que habitan todos los biomas
adaptable(Animal):-
	habitat(Animal,_),
	forall(habitat(_,Bioma), habitat(Animal,Bioma)).

% raro/1 se cumple para todos los animales que habitan un unico bioma
raro(Animal):-
	habitat(Animal,Bioma),
	not((habitat(Animal,OtroBioma), Bioma \= OtroBioma)).
% dominante/1 se cumple para los animales que se comen a todos los otros animales del bioma en el que viven
dominante(Animal):-
	habitat(Animal,Bioma),
	forall((habitat(OtroAnimal,Bioma), Animal \= OtroAnimal),come(Animal,OtroAnimal)).


