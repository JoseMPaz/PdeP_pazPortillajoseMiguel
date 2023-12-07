//Clase Abstracta, nunca de instancia, solo sirve para que hereden de ella
class Personaje
{
	const property fuerza = 100
	const property inteligencia = 100
	var property rol
	
	method potencialOfensivo() = 10 * fuerza + rol.potencialOfensivoExtra()

	method esGroso() = self.esInteligente() or  rol.esGroso(self)
	method esInteligente()
}

class Humano inherits Personaje 
{
	override method esInteligente() = inteligencia > 50
}

class Orco inherits Personaje
{
	override method esInteligente() = false
	override method potencialOfensivo() = super() * 1.1
}

//Roles
object guerrero
{
	method potencialOfensivoExtra() = 10
	method esGroso(personaje) = personaje.fuerza() > 50 
}

object brujo
{
	method potencialOfensivoExtra() = 0
	method esGroso(personaje) = true
}

class Cazador
{
	var property mascota
	method potencialOfensivoExtra() = mascota.potencialOfensivo()
	method esGroso(personaje) = mascota.esLongeva()
}

class Mascota
{
	const property fuerza = 20
	const property edad = 5
	const property tieneGarras = true
	
	method potencialOfensivo() = if (tieneGarras) fuerza * 2 else fuerza
	method esLongeva() = edad > 10
}

//Zonas

class Ejercito
{
	const property miembros = []
	method potencialOfensivo() = miembros.sum{soldado=>soldado.potencialOfensivo()}
	method invadir(zona)
	{
		if(zona.potencialDefensivo() < self.potencialOfensivo())
		{
			zona.seOcupadaPor(self)
		}
	}
}

class Zona
{
	var property habitantes
	method potencialDefensivo() = habitantes.potencialOfensivo()
	method seOcupadaPor(ejercito) 
	{
		habitantes = ejercito
	}
}

class Ciudad inherits Zona
{	
	override method potencialDefensivo() = super() + 300
}

class Aldea inherits Zona
{
	const maximoHabitantes = 50
	override method seOcupadaPor(ejercito)
	{
		if (ejercito.miembros().size() > maximoHabitantes)
	 	{
	 		const nuevosHabitantes = ejercito.miembros().
	 				sortedBy{uno,otro=>uno.potencialOfensivo() > otro.potencialOfensivo()}.take(10)
	 		super(new Ejercito(miembros = nuevosHabitantes))
	 		ejercito.miembros().removeAll(nuevosHabitantes)
	 	}
	 	if (ejercito.miembros().size() <= maximoHabitantes)
			super(ejercito)		
	 }
}

