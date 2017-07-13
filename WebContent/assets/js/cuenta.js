function llenarFormularioCuenta(formularioNombre, result) {
	$(formularioNombre + " .id-usuario-rol").val(result.idUsuarioRol);
	$(formularioNombre + " .matricula").val(result.matricula);
	$(formularioNombre + " .estatus").val(result.estatus);
}

(function($){
	var App = { init: function(){
		App.GetCuenta();
		App.ActualizarCuenta();
	},
		GetCuenta: function() {
			$(".btn-get-cuenta-x").click(function() {
				// alert($(this).attr('data-cuenta'));
				var formularioNombre = "#form-usuario";
				$(formularioNombre)[0].reset();
				initGetCuenta(formularioNombre);
			});
			
			function initGetCuenta(formularioNombre) {
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
						llenarFormularioCuenta(formularioNombre, result);
					}
					
				}).fail(function (jqXHR, textStatus) {

                    // $('#msj-danger-state').empty();

                    $(jqXHR).each(function (key, error) {
                        // hideShowAlert('msj-danger', 'Ocurrio un problema');
                    	console.log("Ocurrio un problema");
                    });

                });
			}
		},
		
		ActualizarCuenta: function() {
			
			$("#guardar-form-usuario").click(function() {
				var formularioNombre = "#form-usuario";
				
				// Validar los campos
				var vErrores = [];

				vRequerido(formularioNombre + ".id-usuario-rol", vErrores, "Por favor selecciona el Rol de Usuario");
				vRequerido(formularioNombre + ".matricula", vErrores, "Por favor llena el campo de Matricula");
				vLogitudMinimaA(formularioNombre + " .matricula", vErrores, "La Matricula minimo tiene que tener 10 caracteres", 10)
				vSoloNumeros(formularioNombre + " .matricula", vErrores, "Solo se permiten numeros para la Matricula")
				vRequerido(formularioNombre + ".password", vErrores, "Por favor llena el campo de Password");
				vRequerido(formularioNombre + ".password-confirmar", vErrores, "Por favor llena el campo de Confirmar Contraseña");
				vEsIgual(formularioNombre + " .password", formularioNombre + " .password-confirmar", vErrores, "El Password debe ser igual")
				vLogitudMinimaA(formularioNombre + " .password", vErrores, "La contraseña minimo tiene que tener 8 caracteres", 8)
				vRequerido(formularioNombre + " .estatus", vErrores, "Por favor selecciona el Estatus del Usuario");
				
				
				if (vErrores.length == 0) {
					
					// Iniciar guardado
					initActualizarCuenta(formularioNombre);
					
				} else {
					
					// Mostrar alerta de errores
					var mensajeAMostros = "<ul>";
					for (var i = 0; i < vErrores.length; i++) {
						mensajeAMostros += "<li>" + vErrores[i] + "</li>";
					}
					mensajeAMostros += "</ul>";
					
					nuevaAlerta("Formulario", mensajeAMostros, "rojo");
				}
			});
			
			function initActualizarCuenta(formularioNombre) {
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
							$("#cerrar-form-usuario").click();
							nuevaAlerta("OK al actualiza", "<p>Cuenta actualizado correctamente.</p>", "verde");
							nuevaAlerta("OK al actualiza", "<p>Para ver los cambios por favor actualize la pagina:</p> <a href='#!' onclick='location.reload();'>Actualizar pagina</a>", "azul");
						
							// Actualizar informacion de la vista
							$(".contenedor-cuenta .matricula").html(result.matricula);
							
						} else {
							nuevaAlerta("Error al actulizar", "<ul><li>Verifique que la Matricula no este usada por otro usuario</li><li>Por favor intentelo nuevamente</li></ul>", "rojo");
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
