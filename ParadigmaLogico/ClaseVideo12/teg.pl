jugador(rojo).
jugador(azul).
jugador(amarillo).

ubicadoEn(argentina,america_del_sur).

aliados(rojo,amarillo).

ocupa(rojo,argentina).

limitrofes(argentina,brasil).

% tienePresenciaEn/2 relaciona un jugador con un continente del cual ocupa al menos un pais.
tienePresenciaEn(Jugador,Continente):-
	ocupa(Jugador,Pais),
	ubicadoEn(Pais,Continente).
	
% puedenAtacarse/2 relaciona 2 jugadores si uno ocupa al menos 1 pais limitrofe a algun otro pais ocupado por el otro jugadores
puedenAtacarse(UnJugador,OtroJugador):-
	ocupa(UnJugador,UnPais),
	ocupa(OtroJugador,OtroPais),
	limitrofes(UnPais,OtroPais).
	
% sinTensiones/2 relaciona 2 jugadores que o bien no pueden atacarse o son aliados
sinTensiones(UnJugador,OtroJugador):-
	aliados(UnJugador,OtroJugador).
sinTensiones(UnJugador,OtroJugador):-
	jugador(UnJugador),
	jugador(OtroJugador),
	not(puedenAtacarse(UnJugador,OtroJugador)).
	
% perdio/1 se cumple para un jugador que no ocupa ningun pais
perdio(Jugador):-
	jugador(Jugador),	
	% el jugador no ocupa algun pais
	not(ocupa(Jugador,_)).
	
% controla/2 relaciona un jugador con un continente si ocupa todos los paises del continente
controla(Jugador,Continente):-
	jugador(Jugador),
	ubicadoEn(_,Continente),
	forall(ubicadoEn(Pais,Continente),ocupa(Jugador,Pais)).
	
controla_(Jugador,Continente):-
	jugador(Jugador),
	ubicadoEn(_,Continente),
	not((ubicadoEn(Pais,Continente),not(ocupa(Jugador,Pais)))).
	
% reñido/1 se cumple para los continentes donde todos los jugadores ocupan algun pais
reñido(Continente):-
	ubicadoEn(_,Continente),%Para hacerlo inversible
	forall(	
				jugador(Jugador),%Dominio
				( ocupa(Jugador,Pais) , ubicadoEn(Pais,Continente) ) %Tiene 2 condiciones 	
			).
	
%No hay un jugador que no ocupe ningun pais del continente
reñido_(Continente):-
	ubicadoEn(_,Continente),
	not(	
			(	jugador(Jugador), 
				not(	(	ocupa(Jugador,Pais),
							ubicadoEn(Pais,Continente)	)	)
			)	
		).

reñido__(Continente):-
	ubicadoEn(_,Continente),%Para hacerlo inversible
	forall(	
				jugador(Jugador),%Dominio
				tienePresenciaEn(Jugador,Continente)  %Tiene 1 condicion
			).
			
reñido___(Continente):-
	ubicadoEn(_,Continente),
	not(	
			(	
				jugador(Jugador), 
				not( tienePresenciaEn(Jugador,Continente)	)
			)	
		).

% atrincherado/1 se cumple para jugadores que ocupan paises en un unico continente
atrincherado(Jugador):-
	ubicadoEn(_,Continente),
	ocupa(Jugador,_),
	forall(ocupa(Jugador,Pais),ubicadoEn(Pais,Continente)).
	
atrincherado_(Jugador):-
	ubicadoEn(_,Continente),
	ocupa(Jugador,_),
	not(	
			(	
				ocupa(Jugador,Pais) , 
				not(	ubicadoEn(Pais,Continente)	)	
			)	
		).

% puedeConquistar/2 Relaciona un jugador con un continente si no lo controla, pero todos los paises del continente
% que le falta ocupar son limitrofes a alguno de los paises que si ocupa y pertenece a alguien que no es su aliado.
puedeConquistar(Jugador,Continente):-
	jugador(Jugador),
	ubicadoEn(_,Continente),
	not(controla(Jugador,Continente)),
	forall(
				(	ubicadoEn(Pais,Continente) , not(ocupa(Jugador,Pais))	),% Universo
				puedeAtacar(Jugador,Pais) % Condicion
			).
			
puedeConquistar(Jugador,Continente):-
	jugador(Jugador),
	ubicadoEn(_,Continente),
	not(controla(Jugador,Continente)),
	not(
				((	ubicadoEn(Pais,Continente) , not(ocupa(Jugador,Pais))	),% Universo
				not(puedeAtacar(Jugador,Pais))) % Condicion
		).
			
% puedeAtacar/2 el pais atacado debe ser limitrofe a alguno de los paises que el jugador ocupa
% y pertenece a alguien que no es su aliado.
puedeAtacar(Jugador,PaisAtacado):-
	ocupa(Jugador,PaisPropio),
	limitrofes(PaisAtacado,PaisPropio),
	not(	(aliados(Jugador,Aliado),ocupa(Aliado,PaisAtacado))	).
	

