$(document).ready(function() {
	
	function btnActualizarNuevoInfoEstudios(formInfDocenteAction) {
		
		var formularioNombre = "#form-info-docente";
		
		// Al dar click en boton de nueva direccion, cambiar URL action del formulario, ocultar boton de actuzaliar y mostar boton de guardar
		$(".btn-crear-docente-laboral").on("click", function() {
			$(formularioNombre)[0].reset();
			
			// Agregar idContacto al formulario de nueva direccion
			$(formularioNombre + " .idUsuario").val($(".btn-crear-docente-laboral").attr("data-id-usuario"));
			$(formularioNombre).attr("action", formInfDocenteAction+"nueva-info-laboral");
			
			$("#guardar-form-info-docente").show();
			$("#actualizar-form-info-docente").hide();
		});
		
		$(".btn-modificar-docente-laboral").on("click", function() {
			$(formularioNombre)[0].reset();
			
			// Agregar idContacto al formulario de nueva direccion
			$(formularioNombre + " .idUsuario").val($(".btn-modificar-docente-laboral").attr("data-id-usuario"));
			$(formularioNombre).attr("action", formInfDocenteAction+"actualizar-info-laboral");
			
			$("#guardar-form-info-docente").hide();
			$("#actualizar-form-info-docente").show();
		});
		
	}
	
	
	//Almacena la ruta de la accion para direcciones (CRUD)
	var formInfDocenteAction = $("#form-info-docente").attr("action");
	
	// Se llama al metodo
	btnActualizarNuevoInfoEstudios(formInfDocenteAction);
	
	
	
	
	function mostrarOcultarSelect() {
		
		if($(".idNivelEstudio").val() == 4) {
			$(".idNivelEstudio-div").slideDown();
		} else {
			$(".idNivelEstudio-div").slideUp();
		}
		
		if($(".reconocimientoPerfilPromepSep").val() == 1) {
			$(".reconocimientoPerfilPromepSep-div").slideDown();
		} else {
			$(".reconocimientoPerfilPromepSep-div").slideUp();
		}
		
		if($(".perteneceCA").val() == 1) {
			$(".perteneceCA-div").slideDown();
		} else {
			$(".perteneceCA-div").slideUp();
		}
		
		if($(".innovadoraConocimiento").val() == 1) {
			$(".innovadoraConocimiento-div").slideDown();
		} else {
			$(".innovadoraConocimiento-div").slideUp();
		}
		
		if($(".ptcRegistradoSNI").val() == 1) {
			$(".ptcRegistradoSNI-div").slideDown();
		} else {
			$(".ptcRegistradoSNI-div").slideUp();
		}
		
		if($(".continuidadEstudios").val() == 1) {
			$(".continuidadEstudios-div").slideDown();
		} else {
			$(".continuidadEstudios-div").slideUp();
		}
		
		if($(".continuidadEstudiosTieneBeca").val() == 1) {
			$(".continuidadEstudiosTieneBeca-div").slideDown();
		} else {
			$(".continuidadEstudiosTieneBeca-div").slideUp();
		}
		
		if($(".imparteLicOtroPe").val() == 1) {
			$(".imparteLicOtroPe-div").slideDown();
		} else {
			$(".imparteLicOtroPe-div").slideUp();
		}
	}
	
	function mostrarOcultarSelectCambio() {
		
		$("#form-info-docente").on("change", "select", function() {
			mostrarOcultarSelect();
		});
		
	}
	
	mostrarOcultarSelect();
	mostrarOcultarSelectCambio();
});



(function($){ 	
	
	var App = { init: function(){
		App.FormDatepickerInfDocente();
		App.NuevaInfDocente();
	},
	
	FormDatepickerInfDocente: function() {
		
	    $("#fIngreso").datepicker({
	    	dateFormat: 'yy-mm-dd',
	    	maxDate : 0,
	    	changeMonth: true,
	        changeYear: true
	    });
	},
	
	NuevaInfDocente: function() {
		$("#guardar-form-info-docente").click(function() {
			var formularioNombre = "#form-info-docente";
			
			// Validar los campos
			var vErrores = [];

			vRequerido(formularioNombre + " .idUsuario", vErrores, "Falta el id del usuario");
			vRequerido(formularioNombre + " .alertOpcionActializar", vErrores, "Falta el alertOpcionActializar");
			
			if($(".idNivelEstudio").val() == 4) {
				vRequerido(formularioNombre + " .especialidadDesc", vErrores, "Falta Nombre de la especialidad");
			} else {
				$(formularioNombre + " .especialidadDesc").val("");
			}
			
			if($(".reconocimientoPerfilPromepSep").val() == 1) {
				vRequerido(formularioNombre + " .reconocimientoPerfilPromepSepDesc", vErrores, "Ingresa Reconocimiento Perfil PROMEP-SEP");
			} else {
				$(formularioNombre + " .reconocimientoPerfilPromepSepDesc").val("");
			}
			
			if($(".perteneceCA").val() == 1) {
				vRequerido(formularioNombre + " .perteneceCADesc", vErrores, "Ingresa CA");
			} else {
				$(formularioNombre + " .perteneceCADesc").val("");
			}
			
			if($(".innovadoraConocimiento").val() == 1) {
				vRequerido(formularioNombre + " .innovadoraConocimientoDesc", vErrores, "Ingresa Nombre de Línea de generación o Aplicación Innovadora del conocimiento");
			} else {
				$(formularioNombre + " .innovadoraConocimientoDesc").val("");
			}
			
			if($(".ptcRegistradoSNI").val() == 1) {
				vRequerido(formularioNombre + " .ptcRegistradoSNIDesc", vErrores, "Ingresar PTC registrados en el SNI");
			} else {
				$(formularioNombre + " .ptcRegistradoSNIDesc").val("");
			}
			
			if($(".continuidadEstudios").val() == 1) {
				vRequerido(formularioNombre + " .continuidadEstudiosQueEstudio", vErrores, "Ingresar lo que se estudia");
				vRequerido(formularioNombre + " .continuidadEstudiosLugar", vErrores, "Ingresar lugar donde estudia");
				
				if($(".continuidadEstudiosTieneBeca").val() == 1) {
					vRequerido(formularioNombre + " .continuidadEstudiosTieneBecaDesc", vErrores, "Falta Especificar Beca");
				} else {
					$(formularioNombre + " .continuidadEstudiosTieneBecaDesc").val("");
				}
				
			} else {
				$(formularioNombre + " .continuidadEstudiosQueEstudio").val("");
				$(formularioNombre + " .continuidadEstudiosLugar").val("");
				$(formularioNombre + " .continuidadEstudiosTieneBecaDesc").val("");
			}
			
			
			if($(".imparteLicOtroPe").val() == 1) {
				vRequerido(formularioNombre + " .imparteLicOtroPeDesc", vErrores, "Ingresar PE");
			} else {
				$(formularioNombre + " .imparteLicOtroPeDesc").val("");
			}
			
			vRequerido(formularioNombre + " .fIngreso", vErrores, "Por favor ingresa la fecha de ingreso a la Universidad");
			vFecha(formularioNombre + " .fIngreso", vErrores, "El formato de la fecha no es valido (YYYY-MM-DD)")
			
			
			if (vErrores.length == 0) {
				// Iniciar guardado
				initGuardarInfDocente(formularioNombre);
				
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
		
		function initGuardarInfDocente(formularioNombre) {
			var form = $(formularioNombre);
			var data = form.serializeArray();
			var route = form.attr("action");
			
			console.log(data);
			
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
						$("#cerrar-form-info-docente").click();
						$(".btn-crear-docente-laboral").hide();
						nuevaAlerta("OK al crear", "<p>Info Docente creada correctamente.</p>", "verde");
						nuevaAlerta("OK al crear", "<p>Para ver los cambios por favor actualize la pagina:</p> <a href='#!' onclick='location.reload();'>Actualizar pagina</a>", "azul");
						
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
	}
};
	
$(function(){
    App.init();
    $(window).resize();
});

})(jQuery);