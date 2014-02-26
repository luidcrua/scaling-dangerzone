class NewTaskCtrl extends Monocle.Controller

	events:
		"tap a[data-action=save]": "onSave"
	
	elements:
		"#txt-name"			: "name"
		"#txt-description"  : "description"
	
	constructor: ->
		super
		__Model.Task.bind "error", @onError
	
	onError: =>
		console.error arguments
	
	onSave: (event) ->
		console.log @name.val(), @description.val()
		
		__Model.Task.create
			name: @name.val()
			description: @description.val()
			
		console.error __Model.Task.all()
		Lungo.Router.section("third")
		
		# console.error __Model.Task.all()
		
		@name.val ""
		@description.val ""

__Controller.NewTask = new NewTaskCtrl "section#second"