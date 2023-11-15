import pepita.*
import pepote.*

object ramiro
{
	var horasDormidas = 0
	method horasDormidas () = horasDormidas
	method horasDormidas (_horasDormidas)
	{
		horasDormidas = _horasDormidas
	}
	method estaDeBuenHumor () = horasDormidas >= 8
	method entrenar (ave)
	{
		const distancia = if ( self.estaDeBuenHumor() ) 15 else 30
		ave.volar(distancia)
	}
}
