import pepita.*
import pepote.*

object ramiro
{
	var horasDormidas = 0
	
	//Getter->Permite obtener el valor del atributo horasDormidas
	method horasDormidas () = horasDormidas
	//Setter->Permite establecer un valor _horasDormidas al atributo horasDormidas
	method horasDormidas (_horasDormidas)
	{
		horasDormidas = _horasDormidas
	}
	
	//Retorna true si horasDormidas es mayor o igual a 8, sino retorna false
	method estaDeBuenHumor () = horasDormidas >= 8
	
	method entrena (ave)
	{
		//Si estaDeBuenHumor es true, asigna 15 a la constante distancia, sino asigna 30
		const distancia = if ( self.estaDeBuenHumor() ) 15 else 30
		//Hace volar a ave la distancia que establecio previamente
		ave.vola(distancia)
	}
}
