// Espera a que se ha terminado de descargar la pagina HTML, para poder ejecutar este script
$(document).ready(function(){
	
	function btnActualizarNuevoNombramiento(formNombramientoAction) {
		
		var formularioNombre = "#form-nombramiento";
		
		// Al dar click en boton de nueva direccion, cambiar URL action del formulario, ocultar boton de actuzaliar y mostar boton de guardar
		$(".contenedor-nombramiento-base").on("click", ".btn-crear-nombramiento", function() {
			
			$(formularioNombre)[0].reset();
			
			// Agregar idContacto al formulario de nueva direccion
			$(formularioNombre + " .idUsuario").val($(".btn-crear-nombramiento").attr("data-id-usuario"));
			$(formularioNombre).attr("action", formNombramientoAction+"nuevo-nombramiento");
			
			$("#guardar-form-nombramiento").show();
			$("#actualizar-form-nombramiento").hide();
		});
		
		// Al dar click en boton de modificar direccion, cambiar URL action del formulario, ocultar boton de guardar y mostar boton de actualizar
		$(".contenedor-nombramiento-base").on("click", ".btn-modificar-nombramiento", function() {
			$(formularioNombre)[0].reset();
			
			$(formularioNombre + " .idUsuario").val($(this).attr("data-id-usuario"));
			$("#form-nombramiento").attr("action", formNombramientoAction+"consultar-nombramiento");
			
			$("#guardar-form-nombramiento").hide();
			$("#actualizar-form-nombramiento").show();
		});
		
		// Al dar click al boton de actualizar direccion, modificar la URL action del formulario
		$("#actualizar-form-nombramiento").on("click", function() {
			$("#form-nombramiento").attr("action", formDireccionAction+"actualizar-nombramiento");
		});
		
		// Al dar click en boton de eliminar direccion, cambiar URL action del formulario
		$(".contenedor-nombramiento-base").on("click", ".btn-get-nombramiento-eliminar", function() {
			$(formularioNombre)[0].reset();
			
			direccionContenedorAEliminar = $(this);
			var idDireccion = $(this).attr("data-id-usuario");
			$(formularioNombre + " .idUsuario").val(idDireccion);
			$("#form-nombramiento").attr("action", formDireccionAction+"eliminar-nombramiento");
			
			$('.alertas-contenedor').prepend('<div class="alerta alerta-rojo" style="display: block"><button class="cerrar-alerta">Cerrar</button><h5 class="titulo">Alerta</h5><p>¿Esta seguro de que quiere eliminar está dirección?<br/> NOTA: Está acción no se puede deshacer.</p><a href="#!" class="btn-eliminar-direccion-confirm-ok" data-id-direccion="'+ idDireccion +'">Eliminar</a><a href="#!" class="btn-eliminar-direccion-confirm-no">Cancelar</a></div>');
		});
	}
	
	
	//Almacena la ruta de la accion para direcciones (CRUD)
	var formNombramientoAction = $("#form-nombramiento").attr("action");
	
	// Se llama al metodo
	btnActualizarNuevoNombramiento(formNombramientoAction);

});


(function($){
	
	var App = { init: function(){
		App.NuevoNombramiento();
	},
		
		NuevoNombramiento: function() {
			
			$("#guardar-form-nombramiento").click(function() {
				var formularioNombre = "#form-nombramiento";
				initGuardarNombramiento(formularioNombre);
			});
			
			function initGuardarNombramiento(formularioNombre) {
				var form = $(formularioNombre);
				var data = form.serializeArray();
				var route = form.attr("action");
				
				$.ajax({
					url: route,
					type: 'POST',
					dataType: 'json',
					data: data,
					
					beforeSend: function() {
						// Enviando datos a actualiza
					},
					
					success: function(result) {
						
						if (result.mensajeAccion == 1) {
							// Cerrar Formulario Actualizar
							$("#cerrar-form-nombramiento").click();
							nuevaAlerta("OK al crear", "<p>Nombramiento creado correctamente.</p>", "verde");
							nuevaAlerta("OK al crear", "<p>Para ver los cambios por favor actualize la pagina:</p> <a href='#!' onclick='location.reload();'>Actualizar pagina</a>", "azul");
						
						} else {
							nuevaAlerta("Error al crear", "<ul><li>Por favor verifique los campos.</li><li>Por favor intentelo nuevamente</li></ul>", "rojo");
						}
					}
					
				}).fail(function (jqXHR, textStatus) {

                    $(jqXHR).each(function (key, error) {
                    	console.log("Ocurrio un problema");
                    });
                    
                    nuevaAlerta("Nueva alerta", "<p>Ocurrio un problema</p>", "rojo");

                });
			}
		}
		
	};
	$(function(){
        App.init();
        $(window).resize();
    });

})(jQuery);




