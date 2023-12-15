class Pizza
{
	var property masaInicial = 500
	var property masaFinal = masaInicial
	const property ingredientes = ["tomate"]
	var gradosDeCocion = 0.3
	var property puntaje = 0
	var property estaVetada = false
	
	//Getter de ingredientes
	method ingredientes() = ingredientes

	method aumentarGradoDeCocion(minutos)
	{
		gradosDeCocion += (10/masaInicial) * minutos
	}
	method perderMasa(minutos)
	{
		masaFinal -= (masaInicial*minutos)/100
	}
	method estaCruda() = gradosDeCocion < 0.4
	method estaQuemada() = gradosDeCocion > 1.0
	//En caso de haber repeticion de ingredientes no coinciden, por ende esta cargada
	method estaCargada() = ingredientes.asSet().size() != ingredientes.size()
}