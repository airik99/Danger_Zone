object espia {
	const saludCritica = 15
	
	method saludCritica() {
		return saludCritica
	}
	
	method finalizarMision(unaMision, unEmpleado) {
   		unEmpleado.habilidades().addAll(unaMision.habilidadesRequeridas())
   }
}

object oficinista {
	var estrellas
	
	method saludCritica() {
		return 40 - 5 * estrellas
	}
   
   method agregarEstrella() {
   		estrellas += 1
   }
   
   method finalizarMision(_, unEmpleado) {
   		self.agregarEstrella()
   		if(estrellas == 3) {
   			unEmpleado.puesto(espia)
   		}
   }
}