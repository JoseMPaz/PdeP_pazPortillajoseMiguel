import vaca.*
import cabra.*

class Corral
{
	const property ordeniables = []
	
	method lecheDisponible() = ordeniables.filter{ordeniable=>ordeniable.estaContenta()}.sum{ordeniable=>ordeniable.litrosDeLeche()}	
	method todasContentas() = ordeniables.all{ordeniable => ordeniable.estaContenta()}
	method ordeniar()
	{
		ordeniables.forEach{ ordeniable => if(ordeniable.estaContenta()) ordeniable.ordeniar() }
	}
}
