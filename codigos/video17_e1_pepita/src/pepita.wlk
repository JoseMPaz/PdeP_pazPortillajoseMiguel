object pepita 
{
	var energia = 100
	
	method vola (kilometros)
	{
		energia = energia - kilometros * 2
	}
	
	method come (gramos)
	{
		energia = energia + gramos * 10
	}
	
	//Es un getter, obtiene el valor del atributo energia y lo retorna 
	//Cuando retorna una expresion se utiliza esa forma de definir metodos
	method energia () = energia
	//Se podria haber definido asi
	/*
	 method energia () 
	 {
	  	return energia
	 }
	*/
}
