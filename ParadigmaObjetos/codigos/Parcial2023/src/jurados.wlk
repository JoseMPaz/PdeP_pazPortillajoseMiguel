import pizzeros.*

class Jurado
{
	var property puntaje = 0
	
	method vetar(pizzero) 
	{
		if(pizzero.pizza().estaCruda())
			pizzero.pizza().estaVetada(true)
	}
	method puntajeDePizzaDe(pizzero)
}

object zeff inherits Jurado
{
	override method puntajeDePizzaDe(pizzero)
	{
		puntaje = pizzero.pizza().masaFinal() / pizzero.pizza().masaInicial()
		if(puntaje < 0)
			throw new DomainException ( message = " El puntaje es negativo ! " )
		return 1.min(puntaje)		
	}
	
	override method vetar(pizzero) 
	{
		if(	pizzero.pizza().estaCruda() || pizzero.pizza().ingredientes().contains("atun"))
			pizzero.pizza().estaVetada(true)
	}
}

object contreras inherits Jurado
{
	var property juradoDeReferencia = zeff
	
	override method puntajeDePizzaDe(pizzero)
	{
		puntaje = 1 - juradoDeReferencia.puntajeDePizzaDe(pizzero) + 
		if(pizzero.pizza().ingredientes().contains("anana")) 0.2 else 0
		
		if(puntaje < 0)
			throw new DomainException ( message = " El puntaje es negativo ! " )
		return 1.min(puntaje)		
	}
}