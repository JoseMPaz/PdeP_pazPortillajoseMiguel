% receta(Nombre,Ingredientes)
%	Ingrediente: [ingrediente(NombreIngrediente,Cantidad)]
receta(	caramelo	,	[ingrediente(agua,100),ingrediente(azucar,100)]).

receta_(caramelo,ingrediente(agua,100)).
receta_(caramelo,ingrediente(azucar,100)).

% member(ElementoDeLaLista,Lista) relaciona un elemento de la lista a la cual pertenece
% length(Lista,longitudDeLaLista) relaciona una lista con su longitudDeLaLista
% sumlist(Lista, TotalDeLaLista) relaciona una lista con el total de su suma de sus elementos

% rapida(Receta) si tiene menos de 4 ingredientes
rapida(Receta):-
	receta(Receta,Ingredientes),
	length(Ingredientes,Total),
	Total < 4.
	
% postre(Receta) si hay un ingrediente azucar que pesa mas de 250g
postre(Receta):-
	receta(Receta,Ingredientes),
	member(ingrediente(azucar,Cantidad),Ingredientes),
	Cantidad > 250.
	
% findall(SELECTOR,CONSULTA,Lista). sirve para relacionar respuestas a consulta seleccionada en una lista

% cantidadDePostres(CantidadDePostres) se cumple para la cantidad de recetas de postres en la base de conocimiento
cantidadDePostres(CantidadDePostres):-
	receta(Receta,_),
	findall(1,postre(Receta),ListaDeUnos),
	sumlist(ListaDeUnos,CantidadDePostres).
	
calorias(ingrediente(agua,100),500).
calorias(ingrediente(azucar,100),1500).
	
% trivial/1 se cumple para recetas con un unico ingredientes
trivial(Receta):-
	receta(Receta,[_]).%Lista con 1 solo ingrediente

% elPeor/2 relaciona una receta con su ingrediente mas calorico
elPeor(Ingredientes,Peor):-
	member(Peor,Ingredientes),
	calorias(Peor,CaloriasDelPeor),
	forall(
		member(Ingrediente,Ingredientes),
		(calorias(Ingrediente,Calorias),CaloriasDelPeor >= Calorias)
	).
	
	

% caloriasTotales/2 relaciona una receta y su total de calorias
caloriasTotales(Receta,Total):-
	receta(Receta,Ingredientes),
	findall(Kcal,(member(Ing,Ingredientes),calorias(Ing,Kcal)),ListaDeKCal),
	sumlist(ListaDeKCal,Total).
	
%	versionLight/2 relaciona una receta con sus ingredientes, sin el peor
versionLight(Receta,IngredientesLight):-
	receta(Receta,Ingredientes),
	elPeor(Ingredientes,Peor),
	findall(Ing,(member(Ing,Ingredientes), Ing \= Peor ),IngredientesLight).

% guasada/1 re cumple para una receta con algun ingrediente de mas de 1000kcal
guasada(Receta):-
	receta(Receta,Ingredientes),
	member(IngredienteEngordador,Ingredientes),
	calorias(IngredienteEngordador,Kcal),
	Kcal > 1000.
