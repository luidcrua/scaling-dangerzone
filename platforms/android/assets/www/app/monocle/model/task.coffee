class __Model.Task extends Monocle.Model
	@fields "name", "description", "done", "created_at"
	
	@pending: ->
		@select (task) -> !task.done
	
	@finished: ->
		@select (task) -> !!task.done
	
	@mixAttributes: ->
		"#{name} - #{description}"
	
	@done: ->
		@select (task) -> !!task.done
	
	validate: ->
		unless @name
			"name is required"