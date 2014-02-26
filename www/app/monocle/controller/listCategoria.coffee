class CategoriaCtrl extends Monocle.Controller
	
	elements:
		"footer a:first-child": "pending"
		"footer a:last-child": "finished"
	
	constructor: ->
		super
		__Model.Categoria.bind "create", @bindCategoriaCreate
		# __Model.Categoria.bind "change", @bindCategoriaChange
	
	bindCategoriaCreate: (categoria) =>
		# console.error "añadida la categoria", categoria
		view = new __View.Categoria model: categoria
		view.append categoria
	
	# bindCategoriaChange: (categoria) =>
		# console.error "alguien ha actualizado la categoria ", categoria
		categorias = __Model.Categoria
		# Lungo.View.Element.count @pending.selector, categorias.pending().length
		# Lungo.Element.count @pending.selector, categorias.pending().length
		# Lungo.Element.count @finished.selector, categorias.finished().length
	
__Controller.list = new CategoriaCtrl "section#centroComercial"

# Lungo.ready ->
# 	__Model.Categoria.create name: "Tarea 1", description: "Lorem"
# 	__Model.Categoria.create name: "Tarea 2", description: "Lorem"
# 	__Model.Categoria.create name: "Tarea 3", description: "Lorem"