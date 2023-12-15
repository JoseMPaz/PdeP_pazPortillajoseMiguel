import pizzeros.*
import jurados.*
import pizza.*

class Concurso
{
	var property pizzeros = [carla,facu,new PizzeroDeLaMaritima(ingredienteDelDia = "atun",ingredienteFavorito="atun")]
	var property jurados = [zeff,contreras]
	
	method cocinanLasPizzas()
	{
		pizzeros.forEach{pizzero=>pizzero.cocinar(5)}
	}
	
	method vetarPizzas()
	{
		pizzeros.forEach{pizzero=>jurados.forEach{jurado=>jurado.vetar(pizzero)}}
		pizzeros.removeAllSuchThat{pizzero=>pizzero.pizza().estaVetada()}
	}
	
	method puntuar(pizzero)
	{
		pizzeros.forEach{cadaPizzero=>jurados.forEach{jurado=>jurado.puntajeDePizzaDe(cadaPizzero)}}
	}
	
	method maximoPuntaje()
	{
		pizzeros.max{pizzero=>pizzero.pizza().puntaje()}
	}
	method nombrarGanador()
	{
		if(pizzeros.isEmpty() )
			throw new DomainException(message="No hay ganador")
		else 
			return pizzeros.first()
	}
}

