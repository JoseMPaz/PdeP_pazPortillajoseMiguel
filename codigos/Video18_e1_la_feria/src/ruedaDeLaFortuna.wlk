object ruedaDeLaFortuna
{
	var property aceitada = true
	
	//0.randomUpTo(20) Genera un numero real aleatorio entre 0 y 20
	//roundUp() Redonde un numero real a uno entero, redondeando para arriba
	method ticketsGanados (jugador) = 0.randomUpTo(20).roundUp()
	method cansancioQueProduce() = if (aceitada) 0 else 1
}
