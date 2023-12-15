object usuarios 
{
	const todosLosUsuarios = []	
	
	method emailsDeUsuariosRicos() = todosLosUsuarios.
		filter{usuario=>usuario.verificado()}.
		sortedBy{uno,otro=>uno.saldoTotal() > otro.saldoTotal()}.
		take(100).
		map{usuario=>usuario.email()}
	
	method cantidadDeSuperUsuario() = todosLosUsuarios.
		count{usuario=>usuario.esSuperUsuario()}
}

class Usuario
{
	const property nombre
	const property email
	const property verificado = false
	const contenidos = []
	
	method saldoTotal() = contenidos.
		sum{contenido=>contenido.recaudacion()}
	method esSuperUsuario() = contenidos.
		count{contenido=>contenido.esPopular()} >= 10
		
	method publicar(contenido,monetizacion)
	{
		if(monetizacion.puedeAplicarseA(contenido))
			throw new DomainException(message="El contenido no soporta la forma de monetizacion")
		contenido.monetizacion(monetizacion)
		contenidos.add(contenido)	
	}
}