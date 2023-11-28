object pepote 
{
	var volado = 0
	var comido = 0
	
	method vola (kilometros)
	{
		volado = volado + kilometros
	}	
	method come(gramos)
	{
		comido = comido + gramos
	}
	method energia () = 255 + comido **2 - volado / 5
}
