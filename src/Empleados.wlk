import tiposEmpleado.*
import EquiposYMisiones.*

class Empleado {
	var salud
	var property habilidades = #{}
	var property puesto
	
	method puedeUsarLaHabilidad(unaHabilidad) {
		return not(self.estaIncapacitado()) and habilidades.contains(unaHabilidad)
	}
	
	method estaIncapacitado() {
		return salud < puesto.saludCritica()
   }
   
   method cumplirMision(unaMision) {
   		if(self.poseeTodasLasHabilidades(unaMision)) {
   			self.recibirDanio(unaMision.peligrosidad())
   		} else {
   			throw new Exception (message = "El empleado no puede cumplir con la mision")
   		}
   }
   
   method finalizarMision(unaMision) {
   		if(self.estaVivo()) {
   				puesto.finalizarMision(unaMision, self)
   			} else {
   				throw new Exception (message = "El empleado no sobrevivio a la mision")
   		}
   }
   
   method estaVivo() {
   		return salud > 0
   }
   
   method poseeTodasLasHabilidades(unaMision) {
   		return unaMision.habilidadesRequeridas().all { habilidad => habilidades.contains(habilidad) }
   }
   
   method recibirDanio(unaCantidad) {
   		salud -= unaCantidad
   }
   
}

class Jefe inherits Empleado {
	var subordinados = []
	
	override method puedeUsarLaHabilidad(unaHabilidad) {
		super(unaHabilidad)
		return subordinados.any { subordinado => subordinado.puedeUsarLaHabilidad(unaHabilidad) }
	}
}
