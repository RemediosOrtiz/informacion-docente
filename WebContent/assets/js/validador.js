function vRequerido(nombreElemento, vErrores, mensaje) {
	if ($(nombreElemento).val() == "" || $(nombreElemento).val() === null) {
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


function vSoloTexto(nombreElemento, vErrores, mensaje) {
	if ( !(/^[a-z]+$/i.test($(nombreElemento).val())) ) {
		vErrores.push(mensaje);
	}
}



function vEsIgual(nombreElementoA, nombreElementoB, vErrores, mensaje) {
	if ($(nombreElementoA).val() != $(nombreElementoB).val()) {
		vErrores.push(mensaje);
	}
}


function vFecha(nombreElemento, vErrores, mensaje) {
    
    var date_regex = /^(0?[1-9]|1[0-2])\/(0?[1-9]|1\d|2\d|3[01])\/(19|20)\d{2}$/ ;
    if ( date_regex.test($(nombreElemento).val()) == false) {
    	vErrores.push(mensaje);
    }
}