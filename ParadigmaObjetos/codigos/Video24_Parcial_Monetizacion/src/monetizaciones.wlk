object publicidad
{
	method recaudacionDe(contenido) = ( 0.05 * contenido.vistas() + 
		if( contenido.esPopular() ) 2000 else 0).
		min(contenido.recaudacionMaximaDePublicidad())
	
	method puedeAplicarseA(contenido) = not contenido.ofensivo()
}

class Donacion
{
	var property donaciones = 0
	method recaudacionDe(contenido) = donaciones
	method puedeAplicarseA(contenido) = true
}

class Descarga
{
	const property precio
	method recaudacionDe(contenido) = contenido.vistas() * precio
	method puedeAplicarseA(contenido) = contenido.puedeVenderse()
	 
}

class Alquiler inherits Descarga
{
	override method precio() = 1.max(super())
	override method puedeAplicarseA(contenido) = super(contenido) and contenido.puedeAlquilarse()

}