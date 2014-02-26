class __Model.Comercio extends Monocle.Model
	@fields "id", "idCategoria", "idCenComercial", "nombre", "imagen", "imgCabezote", "imgLogo", "descripcion", "visible", "fecha"
	
	@pending: ->
		@select (comercio) -> !comercio.visible
	
	@finished: ->
		@select (comercio) -> !!comercio.visible
	
	@byCategoria: (categoriaId) ->
		@select (comercio) -> comercio.idCategoria == categoriaId
	
	@byCategoriaCenCom: (categoriaId, cenComercialId) ->
		@select (comercio) -> comercio.idCategoria == categoriaId && comercio.idCenComercial == cenComercialId
	
	validate: ->
		unless @nombre
			"nombre es obligatorio"
		unless @id
			"id es obligatorio"