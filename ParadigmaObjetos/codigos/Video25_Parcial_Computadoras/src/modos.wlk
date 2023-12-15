object standard 
{
	method consumoDe(equipo) = equipo.consumoBase()
	method computoDe(equipo) = equipo.computoBase()
	method realizoComputo(equipo) {	}
}

class Overclock
{	var property usosRestantes
	override method initialize()
	{
		if(usosRestantes < 0)
			throw new DomainException(message = "Los usos restantes deben ser mayor o igual a cero")
	}
	method consumoDe(equipo) = equipo.consumoBase() * 2
	method computoDe(equipo) = equipo.computoBase() + 
		equipo.computoExtraPorOverclock()
	method realizoComputo(equipo) 
	{
		if(usosRestantes == 0)
		{
			equipo.estaQuemado(true)
			throw new DomainException(message = "Equipo quemado!")
		}
		
		usosRestantes--
	}
}

class AhorroDeEnergia
{
	var computosRealizados = 0
	method consumoDe(equipo) = 200
	method periodicidadDeError() = 17
	method computoDe(equipo) = self.consumoDe(equipo) / 
		equipo.consumoBase() * equipo.computoBase()
		
	method realizoComputo(equipo) 
	{
		computosRealizados++
		if(computosRealizados % self.periodicidadDeError() == 0)
			throw new DomainException(message = "Corriendo monitor")
	}
}

class APruebaDeFallos inherits AhorroDeEnergia
{
	override method computoDe(equipo) = super(equipo)/2
	override method periodicidadDeError() = 100
}