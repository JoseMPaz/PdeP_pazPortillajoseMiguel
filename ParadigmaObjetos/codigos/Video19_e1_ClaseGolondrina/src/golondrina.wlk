class Golondrina
{
	var energia = 100
	
	method vola(kilometros)
	{
		energia = energia - kilometros * 2
	}
	
	method come(gramos)
	{
		energia = energia + gramos * 10
	}
	
	method energia() = energia
}