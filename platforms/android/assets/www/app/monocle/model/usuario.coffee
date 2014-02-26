class __Model.Usuario extends Monocle.Model
	@fields "id", "nombre", "email", "sexo", "edad", "ciudad", "idNivelEstudio", "idFacebook", "fecha"
	
	validate: ->
		unless @nombre
			"nombre es obligatorio"
		unless @nombre
			"nombre es obligatorio"
