import monetizaciones.*
class Contenido
{
	const property titulo
	var property vistas = 0
	var property ofensivo = false
	var property monetizacion
	
	//Nuevo Setter de Monetizacion
	method monetizacion(_monetizacion)
	{
		if(not _monetizacion.puedeAplicarseA(self))
			throw new DomainException(message = "Este contenido no soporta la forma de monetizacion")
		monetizacion = _monetizacion
	}
	override method initialize()
	{
		if(not monetizacion.puedeAplicarseA(self))
			throw new DomainException(message = "Este contenido no soporta la forma de monetizacion")
	}
	
	method recaudacion() = monetizacion.recaudacionDe(self)
	method puedeVenderse() = self.esPopular()
	method esPopular()
	method recaudacionMaximaDePublicidad()
	method puedeAlquilarse(contenido)
}

class Video inherits Contenido
{
	override method esPopular() = vistas > 10E3
	override method recaudacionMaximaDePublicidad() = 10E3
	override method puedeAlquilarse(contenido) = true
}

const tagsDeModa = ["objetos","pdep","serPeladoHoy"]

class Imagen inherits Contenido
{
	const property tags = []
	override method esPopular() = tagsDeModa.all{tag => tags.contains(tag)}
	override method recaudacionMaximaDePublicidad() = 4E3
	override method puedeAlquilarse(contenido) = false
}