// Crear alerta
function nuevaAlerta(titulo, contenido, color) {
	$('.alertas-contenedor').prepend('<div class="alerta alerta-'+ color +'"><button class="cerrar-alerta">Cerrar</button><h5 class="titulo">' + titulo +'</h5>' + contenido + '</div>');
	$('.alertas-contenedor .alerta').first().slideDown();
}


// Cerrar Alerta
$('.alertas-contenedor').on("click", ".cerrar-alerta", function() {
    $(this).parent(".alerta").slideUp();
});