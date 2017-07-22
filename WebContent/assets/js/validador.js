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

// (MM/DD/YYYY) 
// YYYY/MM/DD
function vFecha(nombreElemento, vErrores, mensaje) {
    var date_regex = /^\d{4}-\d{2}-\d{2}$/ ;
    if ( !date_regex.test($(nombreElemento).val())) {
    	vErrores.push(mensaje);
    }
    
    console.log($(nombreElemento).val());
}