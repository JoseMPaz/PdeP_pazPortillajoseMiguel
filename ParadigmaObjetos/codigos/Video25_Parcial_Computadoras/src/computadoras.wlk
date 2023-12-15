import modos.*
class Equipo
{
	var property modo = standard
	var property estaQuemado = false
	method estaActivo() = not estaQuemado and self.computo() > 0
	method consumo() = modo.consumoDe(self)
	method computo() = modo.computoDe(self)
	method consumoBase() 
	method computoBase()
	method computoExtraPorOverclock()
	method computar(problema)
	{
		if(problema.complejidad() > self.computo())
			throw new DomainException(message="capacidad excedida")
		modo.realizoComputo(self)
	}
}

class A105 inherits Equipo
{
	override method consumoBase() = 300
	override method computoBase() = 600
	override method computoExtraPorOverclock() = self.computoBase()*0.3
	override method computar(problema) 
	{
		if(problema.complejidad() < 5)
			throw new DomainException(message="Error de fabrica")
		super(problema)
	}
}

class B2 inherits Equipo
{
	const microsInstalados
	override method consumoBase() = 50 * microsInstalados + 10
	override method computoBase() = 800.min(100 * microsInstalados)
	override method computoExtraPorOverclock() = 0.3 * microsInstalados
	
}

class SuperComputadora
{
	const equipos = []
	var totalDeComplejidadComputada = 0
	
	method equiposActivos() = equipos.
		filter{equipo=>equipo.estaActivo()}
		
	method estaActivo() = true
	
	method computo() = self.equiposActivos().
		sum{equipo=>equipo.computo()}
		
	method consumo() = self.equiposActivos().
		sum{equipo=>equipo.consumo()}
		
	method equipoActivoQueMas(criterio) = self.
		equiposActivos().max(criterio)
		
	method malConfigurada() = 
		self.equipoActivoQueMas{equipo=>equipo.consumo()} !=
		self.equipoActivoQueMas{equipo=>equipo.computo()}

	method computar(problema)
	{
		const subProblema = new Problema(complejidad = problema.complejidad() / self.equiposActivos().size())
		self.equiposActivos().forEach{equipo=>equipo.computar(subProblema)}
		totalDeComplejidadComputada += problema.complejidad()
	}
}

class Problema
{
	const property complejidad = 1
}
