class __Model.Categoria extends Monocle.Model
	@fields "id", "nombre", "imagen", "visible", "fecha"
	
	@pending: ->
		@select (categoria) -> !categoria.visible
	
	@finished: ->
		@select (categoria) -> !!categoria.visible
	
	validate: ->
		unless @nombre
			"nombre es obligatorio"
		unless @id
			"id es obligatorio"