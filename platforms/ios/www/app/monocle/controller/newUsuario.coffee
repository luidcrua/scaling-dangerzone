class NewUsuarioCtrl extends Monocle.Controller

	events:
		"tap button[data-action=save]": "onSave"
	
	elements:
		"#txt-nombre"			: "nombre"
		"#cb-sexo"				: "sexo"
		"#cb-ano"				: "ano"
		"#cb-mes"				: "mes"
		"#cb-dia"				: "dia"
		"#txt-email"			: "email"
		"#cb-ciudad"			: "ciudad"
		"#cb-nivAcademico"		: "nivAcademico"
	
	constructor: ->
		super
		__Model.Usuario.bind "error", @onError
		__Model.Usuario.bind "create", @bindUsuarioCreate
	
	onError: =>
		console.error arguments
	
	bindUsuarioCreate: (usuario) =>
		console.error "añadido el usuario", usuario
	
	onSave: (event) ->
		console.log @nombre.val(), @sexo.val()
		###
		# Se realizan todas las validaciones
			nombre: @nombre.val()
			sexo: @sexo.val() # dropdown
			edad: @edad.val() # Cambio por fechaNac
			email: @email.val()
			ciudad: @ciudad.val() # dropdown
			nivAcademico: @nivAcademico.val() # dropdown
		###
		if @nombre.val() == "" || @sexo.val() == "0" || @email.val() == "" || @ciudad.val() == "0" || @nivAcademico.val() == "0"
			Lungo.Notification.error "Error",
				"Todos los datos son obligatorios",
				"remove",
				2
		else
			if /^\D*$/.test @nombre.val()
				if /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test @email.val()
					console.log "ADSA"
					imgUsuario = __Model.Usuario.findBy "id", 1003
					if imgUsuario is undefined
						imgUsuario = ""
					$$.post 'http://www.mukuralab.com/appmall/kumbia/json/registroUsu',
						{nombre: @nombre.val(), email: @email.val(), sexo: @sexo.val(), fechaNac: @ano.val() + "-" + @mes.val() + "-" + @dia.val(), ciudad: @ciudad.val(), idNivelEstudio: @nivAcademico.val(),imagen:imgUsuario.nombre, idFacebook: "", error: '1'},
						(data) ->
							# Lungo.Notification.hide()
							console.log data
							switch data.idError
								when "0", 0
									###
									# VOLVER TODO A CEROOOOOOOOOO
									$$("#txt_nombre").val ""
									$$("#txt_cedula").val ""
									$$("#txt_telefono").val ""
									$$("#txt_celular").val ""
									$$("#txt_email_cliente").val ""
									$$("#txtar_observaciones").val ""
									$$("#cbTipoAsesoria").val "0"
									# Esconde el botón de siguiente
									$$("#btnSiguiente").hide()
									# Esconde la selección de tipo de asesoría
									$$("#liTipoAsesoria").children().first().hide()
									# Retira la selección del botón actual tanto de reporte como de servicio
									quitar = "activo_"
									poner = "inactivo_"
									__Model.Reporte.selectButton window.tipoReporteSeleccionado, quitar, poner
									__Model.Reporte.selectButton window.tipoServicioSeleccionado, quitar, poner
									window.tipoReporteSeleccionado = ""
									window.tipoServicioSeleccionado = ""
									###
									# Guarda los datos del usuario
									usuarioObj = {idUsuario: "1", nombre: $$("#txt-nombre").val()}
									Lungo.Data.Storage.persistent "userInfo", usuarioObj
									# Devuelve al usuario al inicio del reporte
									Lungo.Notification.success "Reporte enviado",
										"Tu reporte fue enviado exitosamente",
										"ok",
										2,
										() ->
											Lungo.Router.section "main"
								else
									# Lungo.Notification.html '', "Close"
									Lungo.Notification.error "Error",
										"Ocurrió un error, intenta nuevamente",
										"remove",
										2
					console.log "FOLLOW"
				else
					Lungo.Notification.error "Error",
						"El email debe tener la estructura xxxx@xxxx.xxx.",
						"remove",
						2
			else
				Lungo.Notification.error "Error",
					"El nombre debe contener únicamente letras.",
					"remove",
					2
		
		__Model.Usuario.create
			nombre: @nombre.val()
			sexo: @sexo.val()
			edad: @edad.val()
			email: @email.val()
			ciudad: @ciudad.val()
			nivAcademico: @nivAcademico.val()
			
		console.error __Model.Usuario.all()
		Lungo.Router.section("noti")
		
		# console.error __Model.Usuario.all()
		
		@nombre.val ""
		@sexo.val ""
		@edad.val ""
		@email.val ""
		@ciudad.val ""
		@nivAcademico.val ""

__Controller.NewUsuario = new NewUsuarioCtrl "section#registro"