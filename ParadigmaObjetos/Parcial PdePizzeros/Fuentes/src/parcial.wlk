object concurso
{
	const property pizzeros = []
	const property jurados = []
	
}

class Pizza
{
	const property gramosIniciales = 500
	var property gramos = gramosIniciales
	var property gradosDeCoccion = 0.3
	const property ingredientes = []
}


class Pizzero
{
	var property pizza = new Pizza()
	
	method cocinar(minutos) 
	{
		pizza.ingredientes().add("tomate")
		pizza.ingredientes().add("muzzarella")
		self.darToque()
		self.hornear(10)
	}
	
	method hornear(minutos)
	{
		pizza.gradosDeCoccion(pizza.gradosDeCoccion() + 10/pizza.gramosIniciales()*minutos)
		pizza.gramos(pizza.gramosIniciales()*(1-0.01*minutos))
	}
	
	
	
	method darToque()
}

object carla inherits Pizzero
{
	override method darToque()
	{
		pizza.ingredientes().add("provolone")
		self.hornear(1)
	}
}

object facu inherits Pizzero
{
	var property humor = arriesgado
	override method darToque()
	{
		humor.agregar(pizza)
	}
}

object arriesgado
{
	method agregar(pizza)
	{
		pizza.ingredientes().add("anana")
	}
}

object conservador
{
	method agregar(pizza)
	{
		pizza.ingredientes().add("oregano")
	}
}

class LaMaritima inherits Pizzero
{
	const property ingredienteFavorito
	var property ingredienteDelDia
	
	override method pizza ()
	{
		pizza = new Pizza(gramosIniciales = 650)
	}
	
	override method darToque()
	{
		pizza.ingredientes().add(self.ingredienteFavorito())
		pizza.ingredientes().add(self.ingredienteDelDia())
	}
}
