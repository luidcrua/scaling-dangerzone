class ComercioCtrl extends Monocle.Controller
	
	elements:
		"footer a:first-child": "pending"
		"footer a:last-child": "finished"
	
	constructor: ->
		super
		# __Model.Comercio.bind "create", @bindComercioCreate
		# __Model.Comercio.bind "change", @bindComercioChange
	
	bindComercioCreate: (comercio) =>
		# console.error "añadido el comercio", comercio
		view = new __View.Comercio model: comercio
		view.append comercio
	
	# bindComercioChange: (comercio) =>
		console.error "alguien ha actualizado el comercio ", comercio
		comercios = __Model.Comercio
		# Lungo.View.Element.count @pending.selector, categorias.pending().length
		# Lungo.Element.count @pending.selector, categorias.pending().length
		# Lungo.Element.count @finished.selector, categorias.finished().length
	
__Controller.list = new ComercioCtrl "section#subcategorias"

# Lungo.ready ->
# 	__Model.Comercio.create id: "1", name: "Tarea 1", description: "Lorem"
# 	__Model.Categoria.create name: "Tarea 2", description: "Lorem"
# 	__Model.Categoria.create name: "Tarea 3", description: "Lorem"