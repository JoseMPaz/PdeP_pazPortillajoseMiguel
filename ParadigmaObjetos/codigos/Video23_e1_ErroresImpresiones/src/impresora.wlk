import cabezal.*
import cartucho.*

class Impresora
{
	const cabezal
	const cabezalAux
	var property ocupada
	
	method trazar(recorrido)
	{
		
	}
	method mostrarEnPantalla(mensaje)
	{
		
	}
	
	method imprimir(documento)
	{
		if (ocupada) throw new NoPuedoImprimirException()
		
		ocupada = true
	
		try
		{
			cabezal.eyectar(documento.tinta())
			self.trazar(documento.recorrido())
		}
		catch error: SinCargaException
		{
			cabezalAux.eyectar(documento.tinta())
		}then always
		{
			ocupada = false
		}	
	}
}

class NoPuedoImprimirException inherits DomainException
{
	
}
