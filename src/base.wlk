// PROBLEMA COMUN
// SOLUCION COMUN / PATRON DE DISEÑO DE SOFTWARE  Template Method

class Trabajador { // clase abstracta
	var cuenta = 0
	method basico(ganancia) 
	method adelantos() = 0
	method cobraPresentismo() = false
	
	method sueldoPara(ganancia) = self.basico(ganancia) + self.presentismo(ganancia) - self.impuestos(ganancia) - self.adelantos()
	
	method impuestos(ganancia) = self.basico(ganancia) * 0.05
	
	method presentismo(ganancia) = if (self.cobraPresentismo()) (self.basico(ganancia) / 12) else 0
	
	method cobrarSueldo(ganancia){
		//cuenta += self.sueldoPara(ganancia)
		cuenta = cuenta + self.sueldoPara(ganancia)
	}
	
	method gastar(monto){
		if (cuenta <= monto){
			throw new DomainException(message = "No se puede quedar sin dinero")
		}
		cuenta = cuenta - monto
	}
	
}

class Cooperativista inherits Trabajador {
	const sociesCooperativa
	override method basico(ganancia) = ganancia / sociesCooperativa
}

class Empleade inherits Trabajador {
	
//TODO	En el caso de empleades, además, si luego del gasto les quedan menos de 500 pesos, piden un adelanto de 1000.
	var ausencias = 0
	var adelantos = 0
	
	method faltarUnDia() { ausencias = ausencias + 1 }
	
	override method basico(ganancia) = ganancia * 0.01
		
	method pedirAdelanto(monto) {
		cuenta = cuenta + monto
		adelantos = adelantos + monto
	}
	
	
	override method cobraPresentismo() = ausencias == 0
	
	override method adelantos() = adelantos
	
	override method gastar(monto){
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

