import juegos.*
import premios.*

object julieta
{
	//Cantidad de Tickets del año anterior, puede ser modificado
	var property tickets = 15
	//Esta completamente descansada
	var cansancio = 0
	
	method punteria() = 20
	method fuerza() = 80 - cansancio
	
	//Cada vez que juega algun juego, cambian el valor de sus atriburos tickets y cansancio
	method jugar ( juego )
	{
		tickets = tickets + juego.ticketsGanados (self)
		cansancio = cansancio + juego.cansancioQueProduce ()
	}
	method puedeCanjear ( premio ) = tickets >= premio.costo()
}
object gerundio
{
	method jugar() { }
	method puedeCanjear ( premio ) = true
}