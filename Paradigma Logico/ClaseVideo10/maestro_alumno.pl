% humano(Humano)
humano(socrates).
humano(platon).
humano(aristoteles).

% mortal(Alguien)
% Alguien es mortal si es humano o bien si es el gallo de asclepio
mortal(Alguien):-
	humano(Alguien).
mortal(gallo_de_asclepio).

% maestro(Maestro,Alumno)
maestro(socrates,platon).
maestro(platon,aristoteles).
maestro(socrates,jose).

% groso(Alguien)
% Alguien es groso si es maestro de al menos 2 alumnos
groso(Alguien):-
	maestro(Alguien,UnAlumno),
	maestro(Alguien,OtroAlumno),
	UnAlumno \= OtroAlumno.
