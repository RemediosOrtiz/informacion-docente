function llenarFormularioDireccion(formularioNombre, result) {
	$(formularioNombre + " .idDireccion").val(result.idDireccion);
	$(formularioNombre + " .idContacto").val(result.idContacto);
	$(formularioNombre + " .idTipoLugar").val(result.idTipoLugar);
	$(formularioNombre + " .calle").val(result.calle);
	$(formularioNombre + " .numero").val(result.numero);
	$(formularioNombre + " .cp").val(result.cp);
}

var direccionContenedorAEliminar = null;

// Espera a que se ha terminado de descargar la pagina HTML, para poder ejecutar este script
$(document).ready(function(){
	
	function btnActualizarNuevo(formDireccionAction) {
		
		var formularioNombre = "#form-direccion";
		
		// Al dar click en boton de nueva direccion, cambiar URL action del formulario, ocultar boton de actuzaliar y mostar boton de guardar
		$(".contenedor-direccion-base").on("click", ".btn-crear-direccion", function() {
			
			$(formularioNombre)[0].reset();
			
			// Agregar idContacto al formulario de nueva direccion
			$(formularioNombre + " .idContacto").val($(".btn-crear-direccion").attr("data-id-contacto"));
			$(formularioNombre).attr("action", formDireccionAction+"nueva-direccion");
			
			$("#guardar-form-direccion").show();
			$("#actualizar-form-direccion").hide();
		});
		
		// Al dar click en boton de modificar direccion, cambiar URL action del formulario, ocultar boton de guardar y mostar boton de actualizar
		$(".contenedor-direccion-base").on("click", ".btn-modificar-direccion", function() {
			$(formularioNombre)[0].reset();
			
			$(formularioNombre + " .idDireccion").val($(this).attr("data-id-direccion"));
			$("#form-direccion").attr("action", formDireccionAction+"consultar-direccion");
			
			$("#guardar-form-direccion").hide();
			$("#actualizar-form-direccion").show();
		});
		
		// Al dar click al boton de actualizar direccion, modificar la URL action del formulario
		$("#actualizar-form-direccion").on("click", function() {
			$("#form-direccion").attr("action", formDireccionAction+"actualizar-direccion");
		});
		
		// Al dar click en boton de eliminar direccion, cambiar URL action del formulario
		$(".contenedor-direccion-base").on("click", ".btn-get-direccion-eliminar", function() {
			$(formularioNombre)[0].reset();
			
			direccionContenedorAEliminar = $(this);
			var idDireccion = $(this).attr("data-id-direccion");
			$(formularioNombre + " .idDireccion").val(idDireccion);
			$("#form-direccion").attr("action", formDireccionAction+"eliminar-direccion");
			
			$('.alertas-contenedor').prepend('<div class="alerta alerta-rojo" style="display: block"><button class="cerrar-alerta">Cerrar</button><h5 class="titulo">Alerta</h5><p>¿Esta seguro de que quiere eliminar está dirección?<br/> NOTA: Está acción no se puede deshacer.</p><a href="#!" class="btn-eliminar-direccion-confirm-ok" data-id-direccion="'+ idDireccion +'">Eliminar</a><a href="#!" class="btn-eliminar-direccion-confirm-no">Cancelar</a></div>');
		});
	}
	
	
	//Almacena la ruta de la accion para direcciones (CRUD)
	var formDireccionAction = $("#form-direccion").attr("action");
	
	// Se llama al metodo
	btnActualizarNuevo(formDireccionAction);

});



(function($){
	
	var App = { init: function(){
		App.GetDireccion();
		App.NuevaDireccion();
		App.ActualizarDireccion();
		App.EliminarDireccion();
	},
		
		GetDireccion: function() {
			$(".contenedor-direccion-base").on("click", ".btn-get-direccion-actualizar", function() {
				
				var formularioNombre = "#form-direccion";
				
				initGetDireccion(formularioNombre);
			});
			
			function initGetDireccion(formularioNombre) {
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
						llenarFormularioDireccion(formularioNombre, result);
					}
					
				}).fail(function (jqXHR, textStatus) {

                    $(jqXHR).each(function (key, error) {
                    	nuevaAlerta("Error al consultar", "<p>Ocurrio un problema al consultar la dirección.</p>", "rojo");
                    });

                });
			}
		},
		
		NuevaDireccion: function() {
			
			$("#guardar-form-direccion").click(function() {
				var formularioNombre = "#form-direccion";
				
				// Validar los campos
				var vErrores = [];

				vRequerido(formularioNombre + " .idContacto", vErrores, "Falta el id del contacto");
				vRequerido(formularioNombre + " .idTipoLugar", vErrores, "Selecciona un tipo de dirección valido");
								
				vRequerido(formularioNombre + " .calle", vErrores, "Por favor ingresa una calle");
				
				vRequerido(formularioNombre + " .numero", vErrores, "Por favor ingresa un número");
				vSoloNumeros(formularioNombre + " .numero", vErrores, "El número no es valido (Solo números)");
				
				vRequerido(formularioNombre + " .cp", vErrores, "Por favor ingresa un CP");
				vLogitudMinimaA(formularioNombre + " .cp", vErrores, "El CP debe tenermi minimo 5 número", 5);
				vSoloNumeros(formularioNombre + " .cp", vErrores, "El CP no es valido (Solo números)");
				
				if (vErrores.length == 0) {
					// Iniciar guardado
					initGuardarDireccion(formularioNombre);
					
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
			
			function initGuardarDireccion(formularioNombre) {
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
							$("#cerrar-form-direccion").click();
							nuevaAlerta("OK al crear", "<p>Dirección creada correctamente.</p>", "verde");
							nuevaAlerta("OK al crear", "<p>Para ver los cambios por favor actualize la pagina:</p> <a href='#!' onclick='location.reload();'>Actualizar pagina</a>", "azul");
						
							// Actualizar informacion de la vista
							// $(".contenedor-cuenta .matricula").html(result.matricula);
							
						} else {
							nuevaAlerta("Error al crear", "<ul><li>Por favor verifique los campos.</li><li>Por favor intentelo nuevamente</li></ul>", "rojo");
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
		},
		
		ActualizarDireccion: function() {
			
			$("#actualizar-form-direccion").click(function() {
				var formularioNombre = "#form-direccion";
				
				// Validar los campos
				var vErrores = [];

				vRequerido(formularioNombre + " .idContacto", vErrores, "Falta el id del contacto");
				vRequerido(formularioNombre + " .idTipoLugar", vErrores, "Selecciona un tipo de dirección valido");
								
				vRequerido(formularioNombre + " .calle", vErrores, "Por favor ingresa una calle");
				
				vRequerido(formularioNombre + " .numero", vErrores, "Por favor ingresa un número");
				vSoloNumeros(formularioNombre + " .numero", vErrores, "El número no es valido (Solo números)");
				
				vRequerido(formularioNombre + " .cp", vErrores, "Por favor ingresa un CP");
				vLogitudMinimaA(formularioNombre + " .cp", vErrores, "El CP debe tenermi minimo 5 número", 5);
				vSoloNumeros(formularioNombre + " .cp", vErrores, "El CP no es valido (Solo números)");
				
				if (vErrores.length == 0) {
					// Iniciar guardado
					initActualizarDireccion(formularioNombre);
					
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
			
			function initActualizarDireccion(formularioNombre) {
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
							$("#cerrar-form-direccion").click();
							nuevaAlerta("OK al actualizar", "<p>Dirección actualizada correctamente.</p>", "verde");
							nuevaAlerta("OK al actualizar", "<p>Para ver los cambios por favor actualize la pagina:</p> <a href='#!' onclick='location.reload();'>Actualizar pagina</a>", "azul");
						
							// Actualizar informacion de la vista
							// $(".contenedor-cuenta .matricula").html(result.matricula);
							
						} else {
							nuevaAlerta("Error al actualizar", "<ul><li>Por favor verifique los campos.</li><li>Por favor intentelo nuevamente</li></ul>", "rojo");
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
		},
		
		EliminarDireccion: function() {
			
			var formularioNombre = "#form-direccion";
			
			$('.alertas-contenedor').on("click", ".btn-eliminar-direccion-confirm-ok", function() {
			    
			    var idDireccion = $(this).attr("data-id-direccion");
				$(formularioNombre + " .idDireccion").val(idDireccion);
				
				nuevaAlerta("OK al eliminar", "<p>Dirección eliminada correctamente.</p>", "verde");
				$(this).parent(".alerta").slideUp();
				
				// Inicia eliminación
				initEliminarDireccion(formularioNombre);
				
			});
			
			
			$('.alertas-contenedor').on("click", ".btn-eliminar-direccion-confirm-no", function() {
				$(this).parent(".alerta").slideUp();
			});
			
			function initEliminarDireccion(formularioNombre) {
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
							
							// Borrar Div que contiene la direccion que ha sido eliminada
							direccionContenedorAEliminar.parents(".contenedor-direccion").slideUp();
							
						} else {
							nuevaAlerta("Error al eliminar", "<ul><li>Por favor verifique los campos.</li><li>Por favor intentelo nuevamente</li></ul>", "rojo");
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
