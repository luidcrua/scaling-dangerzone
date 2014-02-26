class __View.Task extends Monocle.View
	
	container: "section#third article ul"
	
	template_url: "app/resources/templates/task.html"
	
	# template: """
	# 	<li>
	# 		<strong>{{name}}</strong>
	# 		<small>{{description}}</small>
	# 	</li>
	# 	"""
	
	events:
		"tap li": "onTap"
	
	onTap: (event) ->
		@model.updateAttributes done: true
		@refresh()
		# console.error @model