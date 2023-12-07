class Misil
{
	const potencia
	var agotada = false
	
	method dispararA(objetivo)
	{
		agotada = true
		objetivo.sufrirDanio(potencia)
	}
	method agotada() = agotada
}

class MisilTermico inherits Misil
{
	override method dispararA(objetivo)
	{
		if (objetivo.emiteCalor())
		{
			super(objetivo)
		}
	}
}

//Clase abstracta, no sera instanciada
class ArmaRecargable
{
	var cargador = 100
	method recargar()
	{
		cargador = 100
	}
	method agotada() = cargador <= 0
}

class Metralla inherits ArmaRecargable
{
	const property calibre
	
	method dispararA(objetivo)
	{
		cargador = cargador - 10
		if (calibre >50)
			objetivo.sufrirDanio(calibre/4)
	}
}

//Clase abstracta, no sera instanciada
class ArmaRociadora inherits ArmaRecargable
{
	method dispararA(objetivo)
	{
		cargador = cargador - self.descargarPorRafaga()
		self.causarEfecto(objetivo)
	}
	//Metodo Abstracto ya que no tiene la logica
	method causarEfecto(objetivo)
	method descargarPorRafaga() = 20
}
class LanzaLlamas inherits ArmaRociadora
{
	override method causarEfecto(objetivo)
	{
		objetivo.prendidoFuego(true)
	}
}

class MataFuego inherits ArmaRociadora
{
	override method causarEfecto(objetivo)
	{
		objetivo.prendidoFuego(false)
	}
}

class Sellador inherits ArmaRociadora
{
	override method causarEfecto(objetivo)
	{
		objetivo.salud( objetivo.salud() * 1.1)
	}
	
	override method descargarPorRafaga() = 25
}
