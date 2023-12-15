import cartucho.*

class Cabezal
{
	const eficiencia
	const cartucho
	
	method liberar()
	{
		
	}
	
	method eyectar(cantidad)
	{
		cartucho.extraer(1/eficiencia * cantidad)
		self.liberar()
	}
}
