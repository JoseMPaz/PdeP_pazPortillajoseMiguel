class Cartucho
{
	var property carga = 100
	
	method extraer(cantidad)
	{
		if(carga < cantidad)
			throw new SinCargaException(carga = carga)
		carga -= cantidad
	}
}

class SinCargaException inherits DomainException
{
	const property carga
}