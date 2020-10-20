class Trabajador {
	var cuenta = 0

	method basico(ganancia) 	//abstracto
	method cobraPresentismo()   //abstracto
	
	method adelantos() = 0
	method cuenta() = cuenta
	method cobrarSueldo(ganancia){
		cuenta = cuenta + self.sueldoPara(ganancia)
	}
	
	method sueldoPara(ganancia) {
		const basico = self.basico(ganancia)
		return basico + self.presentismo(basico) - self.impuestos(basico) - self.adelantos()
	}
	
	method presentismo(base) = if (self.cobraPresentismo())  base / 12 else 0
	
	method impuestos(base) = base * 0.05

	method gastar(monto){
		if (cuenta - monto < 0){
			throw new DomainException(message = "No puedo quedarme sin plata")
		}
		cuenta = cuenta - monto
	}
}

class Cooperativista inherits Trabajador {
	const sociesCooperativa
	override method basico(ganancia) = ganancia / sociesCooperativa
	override method cobraPresentismo() = false
}

class Empleade inherits Trabajador {
	var ausencias = 0
	var adelantos = 0
	
	method faltarUnDia() { ausencias = ausencias + 1 }
	
	override method basico(ganancia) = ganancia * 0.01
	
	override method cobraPresentismo() = ausencias == 0
	
	override method gastar(monto){
		super(monto)
		if (cuenta < 500){
			self.pedirAdelanto(500)
		}
	}
	
	method pedirAdelanto(monto) {
		cuenta = cuenta + monto
		adelantos = adelantos + monto
	}
	
	override method adelantos() = adelantos
}

class Emprendedor inherits Trabajador{
	
	override method basico(ganancia) = 5000
	
	override method cobraPresentismo() = false
}

class Empresarie inherits Trabajador{
	
	override method basico(ganancia) = ganancia * 0.8
	
	override method cobraPresentismo() = true
	
}

