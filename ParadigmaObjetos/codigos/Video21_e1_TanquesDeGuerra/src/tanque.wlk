import arma.*

class Tanque
{
	const armas = []
	const tripulantes = 2
	var property salud = 1E3
	var property prendidoFuego = false
	
	method emiteCalor() = prendidoFuego or tripulantes > 3
	
	method sufrirDanio(danio)
	{
		salud = salud - danio
	}
	
	method atacar(objetivo)
	{
		armas.anyOne().dispararA(objetivo)
	}
}

class TanqueBlindado inherits Tanque
{
	const blindaje = 200
	
	override method emiteCalor() = false
	
	override method sufrirDanio(danio)
	{
		if(danio < blindaje)
			super(danio - blindaje)
	}
}