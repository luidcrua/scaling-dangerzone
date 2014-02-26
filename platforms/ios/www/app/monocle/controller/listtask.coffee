class ListCtrl extends Monocle.Controller
	
	elements:
		"footer a:first-child": "pending"
		"footer a:last-child": "finished"
	
	constructor: ->
		super
		__Model.Task.bind "create", @bindTaskCreate
		__Model.Task.bind "change", @bindTaskChange
	
	bindTaskCreate: (task) =>
		# console.error "añadida la tarea", task
		view = new __View.Task model: task
		view.append task
	
	bindTaskChange: (task) =>
		console.error "alguien ha actualizado la tarea ", task
		tasks = __Model.Task
		# Lungo.View.Element.count @pending.selector, tasks.pending().length
		Lungo.Element.count @pending.selector, tasks.pending().length
		Lungo.Element.count @finished.selector, tasks.finished().length
	
__Controller.list = new ListCtrl "section#third"

Lungo.ready ->
	__Model.Task.create name: "Tarea 1", description: "Lorem"
	__Model.Task.create name: "Tarea 2", description: "Lorem"
	__Model.Task.create name: "Tarea 3", description: "Lorem"
