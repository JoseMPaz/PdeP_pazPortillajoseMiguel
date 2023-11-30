% vende/2 recibe un articulo y su precio
% Functor libro(Titulo,Autor,Genero,Editorial)
% Functor cd(Titulo,Autor,Genero,CantidadDeDiscos,CantidadDeTemas)
vende(libro(elResplandor,stephen_king,terror,de_bolsillo),2300).
vende(libro(mort,terry_pratchett,aventura,plaza_janez),1300).
vende(libro(harry_potter_3,jk_roling,ficcion,salamandra),2500).
vende(cd(different_class,pulp,pop,2,24),1450).
vende(cd(blood_on_the_tracks,bob_dylan,1,12),2500).
vende(peli(it,terror,wallace),1600).

% tematico/1 se cumple para un autor si todo lo que se vende es del autor
tematico(Autor):-
	autor(_,Autor),
	forall(	vende(Articulo,_) , autor(Articulo,Autor)	).
	
% autor/2 relaciona un articulo con su autor ->Polimorfismo	
autor(libro(_,Autor,_,_),Autor):-
	vende(libro(_,Autor,_,_),_).
autor(cd(_,Autor,_,_,_),Autor):-
	vende(cd(_,Autor,_,_,_),_).
	
% libroMasCaro/1 se cumple para un articulo si es el libro de mayor precio
libroMasCaro(libro(Titulo,Autor,Genero,Editorial)):-
	vende(libro(Titulo,Autor,Genero,Editorial),Precio),
	forall(vende(libro(_,_,_,_),OtroPrecio) , OtroPrecio =< Precio).

% curiosidad/1 se cumple para un articulo si es el unico que hay a la venta de su autor
curiosidad(Articulo):-
	vende(Articulo,_),
	autor(Articulo,Autor),
	not(	(vende(OtroArticulo,_),autor(OtroArticulo,Autor),OtroArticulo\=Articulo)	).
	 
% sePrestaAConfusion/1 se cumple para un titulo si pertenece a mas de un articulo
sePrestaAConfusion(Titulo):-
	titulo(UnArticulo,Titulo),
	titulo(OtroArticulo,Titulo),
	UnArticulo\=OtroArticulo.
	
% titulo(Articulo,Titulo)
titulo(libro(Titulo,_,_,_),Titulo):-
	vende(libro(Titulo,_,_,_),_).
titulo(cd(Titulo,_,_,_,_),Titulo):-
	vende(cd(Titulo,_,_,_,_),_).
titulo(peli(Titulo,_,_),Titulo):-
	vende(peli(Titulo,_,_),_).
	
% mixto/1 se cumple para los autores de mas de 1 tipo de articulo
mixto(Autor):-
	autor(libro(_,_,_,_),Autor),
	autor(cd(_,_,_,_,_),Autor).
mixto(Autor):-
	autor(peli(_,_,_),Autor),
	autor(libro(_,_,_,_),Autor).
mixto(Autor):-
	autor(peli(_,_,_),Autor),
	autor(cd(_,_,_,_,_),Autor).

