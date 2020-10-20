class Trabajador { // clase abstracta
	var cuenta = 0 
	
	method cuenta() = cuenta
	
	method basico(ganancia) // abstracto
	
	method cobraPresentismo() = false
	
	method adelantos() = 0
	
	method impuestos(basico) = basico * 0.05
	
	method presentismo(basico) = if (self.cobraPresentismo()) basico / 12 else 0 
	
	// TEMPLATE METHOD 
	// Patrones de diseño
	method sueldoPara(ganancia) {
		const basico = self.basico(ganancia)
		return basico + self.presentismo(basico) - self.impuestos(basico) - self.adelantos()
	}
	
	method cobrarSueldo(ganancia) {
		cuenta = cuenta + self.sueldoPara(ganancia)
	}
	
	method gastarDinero(monto){
		if (monto > cuenta){
			throw new DomainException(message = "No me puedo quedar sin plata")
		}
		cuenta = cuenta - monto
	}
}

class Cooperativista inherits Trabajador {
	const sociesCooperativa

	override method basico(ganancia) = ganancia / sociesCooperativa
}

class Empleade inherits Trabajador {
	var ausencias = 0
	var adelantos = 0
	
	method faltarUnDia() { ausencias = ausencias + 1 }
	
	override method basico(ganancia) = ganancia * 0.01
	
	
	method pedirAdelanto(monto) {
		cuenta = cuenta + monto
		adelantos = adelantos + monto
	}
	
	override method adelantos() = adelantos
	
	override method cobraPresentismo() = ausencias == 0
	
	override method gastarDinero(monto){
		super(monto)
		if (cuenta < 500){
			self.pedirAdelanto(1000)
		}		
	}
}

class Emprendedor inherits Trabajador {
 	override method basico(ganancia) = 5000
}

class Empresarie inherits Trabajador {
	override method basico(ganancia) = ganancia * 0.8

	override method cobraPresentismo() = true 
}

