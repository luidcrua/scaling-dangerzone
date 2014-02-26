class __View.Destacado extends Monocle.View
	
	container: "section#destacados article#artDestacados div#listDestacados"
	
	template_url: "app/resources/templates/promocion.html"
	
	# template: """
	# 	<li>
	# 		<strong>{{name}}</strong>
	# 		<small>{{description}}</small>
	# 	</li>
	# 	"""
	
	# events:
	# 	"tap li": "onTap"
	# 
	# onTap: (event) ->
		# @model.updateAttributes done: true
	# 	@refresh()
		# console.error @model