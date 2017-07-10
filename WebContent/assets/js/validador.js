function vRequerido(nombreElemento, vErrores, mensaje) {
	if ($(nombreElemento).val() == "") {
		vErrores.push(mensaje);
	}
}


function vLogitudMinimaA(nombreElemento, vErrores, mensaje, menorA) {
	if ($(nombreElemento).val().length < menorA ) {
		vErrores.push(mensaje);
	}
}


function vSoloNumeros(nombreElemento, vErrores, mensaje) {
	if ( !(/^[0-9]+$/.test( $(nombreElemento).val()) )) {
		vErrores.push(mensaje);
	}
}


function vEsIgual(nombreElementoA, nombreElementoB, vErrores, mensaje) {
	if ($(nombreElementoA).val() != $(nombreElementoB).val()) {
		vErrores.push(mensaje);
	}
}

