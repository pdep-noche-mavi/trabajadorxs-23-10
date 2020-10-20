class Cooperativista {
	var cuenta = 0 
	const sociesCooperativa
	method cuenta() = cuenta
	method basico(ganancia) = ganancia / sociesCooperativa
}

class Empleade {
	var cuenta = 0 
	var ausencias = 0
	var adelantos = 0
	
	method cuenta() = cuenta
	method faltarUnDia() { ausencias = ausencias + 1 }
	
	method basico(ganancia) = ganancia * 0.01
	
	
	method pedirAdelanto(monto) {
		cuenta = cuenta + monto
		adelantos = adelantos + monto
	}
	
	method adelantos() = adelantos
}

class Emprendedor {
	
 	method basico(ganancia) = 5000
}

class Empresarie {
	
	method basico(ganancia) = ganancia * 0.8
	
}

