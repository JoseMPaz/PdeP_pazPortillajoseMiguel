object pepote 
{
	var volado = 0
	var comido = 0
	
	method volar (kilometros)
	{
		volado += kilometros
	}	
	method comer(gramos)
	{
		comido += gramos
	}
	method energia () = 255 + comido **2 - volado / 5
}
