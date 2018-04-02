function llenarFormularioContacto(formularioNombre, result) {	
	console.log(result);
	
	$(formularioNombre + " .id_contacto").val(result.idContacto);
	$(formularioNombre + " .nombre").val(result.nombre);
	$(formularioNombre + " .apPaterno").val(result.apPaterno);
	$(formularioNombre + " .apMaterno").val(result.apMaterno);
	$(formularioNombre + " .fNacimiento").val(result.fNacimientoX);
	$(formularioNombre + " .sexo").val(result.sexo);
	$(formularioNombre + " .discapacidad").val(result.discapacidad);
}

(function($){
	var App = { init: function(){
		App.FormDatepicker();
		App.GetContacto();
		App.ActualizarContacto();
	},
		FormDatepicker: function() {
			
		    $("#fNacimientoContacto").datepicker({
		    	dateFormat: 'yy-mm-dd',
		    	maxDate : 0,
		    	changeMonth: true,
		        changeYear: true
		    });
		},
		
		GetContacto: function() {
			$(".btn-get-contacto-x").click(function() {
				var formularioNombre = "#form-contacto";
				$(formularioNombre)[0].reset();
				initGetContacto(formularioNombre);
			});
			
			function initGetContacto(formularioNombre) {
				var form = $(formularioNombre);
				var data = form.serializeArray();
				var route = form.attr("action");
				
				$.ajax({
					url: route,
					type: 'GET',
					dataType: 'json',
					data: data,
					
					beforeSend: function() {
						// Enviando datos
					},
					
					success: function(result) {
						// Datos recibidos correctamente
						llenarFormularioContacto(formularioNombre, result);
					}
					
				}).fail(function (jqXHR, textStatus) {

                    $(jqXHR).each(function (key, error) {
                    	nuevaAlerta("Error al consultar", "<p>Ocurrio un problema al consultar el contacto.</p>", "rojo");
                    });

                });
			}
		},
		
		ActualizarContacto: function() {
			
			$("#guardar-form-contacto").click(function() {
				var formularioNombre = "#form-contacto";
				
				// Validar los campos
				var vErrores = [];

				vRequerido(formularioNombre + " .nombre", vErrores, "Por favor ingresa un Nombre");
				vSoloTexto(formularioNombre + " .nombre", vErrores, "Solo se aceptan letras para el Nombre");
				
				vRequerido(formularioNombre + " .apPaterno", vErrores, "Por favor ingresa un Apellido Paterno");
				vSoloTexto(formularioNombre + " .apPaterno", vErrores, "Solo se aceptan letras para el Apellido Paterno");
				
				vRequerido(formularioNombre + " .apMaterno", vErrores, "Por favor ingresa un Apellido Materno");
				vSoloTexto(formularioNombre + " .apMaterno", vErrores, "Solo se aceptan letras para el Apellido Materno");
				
				vRequerido(formularioNombre + " .fNacimiento", vErrores, "Por favor ingresa una Fecha de nacimiento");
				vFecha(formularioNombre + " .fNacimiento", vErrores, "La fecha es incorrecta Por vafor valida que el formato sea: (MM/DD/YYYY) o que no este fuera del limite.");
				vRequerido(formularioNombre + " .sexo", vErrores, "Por favor selecciona un Sexo");
				
				
				if (vErrores.length == 0) {
					
					// Iniciar guardado
					initActualizarContacto(formularioNombre);
					
				} else {
					
					// Mostrar alerta de errores
					var mensajeAMostrar = "<ul>";
					for (var i = 0; i < vErrores.length; i++) {
						mensajeAMostrar += "<li>" + vErrores[i] + "</li>";
					}
					mensajeAMostrar += "</ul>";
					
					nuevaAlerta("Formulario", mensajeAMostrar, "rojo");
				}
			});
			
			function initActualizarContacto(formularioNombre) {
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
							$("#cerrar-form-contacto").click();
							nuevaAlerta("OK al actualiza", "<p>Contacto actualizado correctamente.</p>", "verde");
							nuevaAlerta("OK al actualiza", "<p>Para ver los cambios por favor actualize la pagina:</p> <a href='#!' onclick='location.reload();'>Actualizar pagina</a>", "azul");
						
							// Actualizar informacion de la vista
							// $(".contenedor-cuenta .matricula").html(result.matricula);
							
						} else {
							nuevaAlerta("Error al actulizar", "<ul><li>Por favor verifique los campos.</li><li>Por favor intentelo nuevamente</li></ul>", "rojo");
						}
					}
					
				}).fail(function (jqXHR, textStatus) {

                    $(jqXHR).each(function (key, error) {
                        // hideShowAlert('msj-danger', 'Ocurrio un problema');
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
