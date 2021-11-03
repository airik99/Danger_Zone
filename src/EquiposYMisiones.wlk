import Empleados.*

class Equipo {
	var integrantes = []
	
	method cumplirMision(unaMision) {
   		if(self.algunIntegrantePoseeLasHabilidades(unaMision)) {
   			integrantes.forEach { integrante => integrante.recibirDanio(unaMision.peligrosidad() * 1/3) }
   		} else {
   			throw new Exception (message = "El equipo no puede cumplir con la mision")
   		}
  	}   
  	
   method algunIntegrantePoseeLasHabilidades(unaMision) {
   		return integrantes.any { integrante => integrante.poseeTodasLasHabilidades(unaMision) }
   }
}


class Misiones {
	const property habilidadesRequeridas = #{}
	var property peligrosidad
}
