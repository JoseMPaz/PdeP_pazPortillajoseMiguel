import pizza.*
class Pizzero
{
	var property pizza = new Pizza()
	
	method agregarIngrediente(ingrediente)
	{
		pizza.ingredientes().add(ingrediente)
	}
	method cocinar(minutos)
	{
		self.agregarIngrediente("muzzarella")
		self.agregarToque()
		pizza.aumentarGradoDeCocion(minutos)
		pizza.perderMasa(minutos)
	}
	
	method agregarToque()
}

object carla inherits Pizzero
{
	override method agregarToque()
	{
		self.agregarIngrediente("provolone")
	}
}

object facu inherits Pizzero
{
	var property seSienteArriesgado = false
	
	override method agregarToque()
	{
		if(seSienteArriesgado)
		{
			self.agregarIngrediente("anana")
		}
		else
		{
			self.agregarIngrediente("oregano")
		}
	}	
}

class PizzeroDeLaMaritima inherits Pizzero
{
	const property ingredienteFavorito
	var property ingredienteDelDia
	
	override method agregarToque()
	{
		pizza.masaInicial(650)
		self.agregarIngrediente(ingredienteFavorito)
		self.agregarIngrediente(ingredienteDelDia)
	}
}