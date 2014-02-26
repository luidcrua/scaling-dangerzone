class __View.Categoria extends Monocle.View
	
	container: "section#centroComercial article#layout-art2 div#listCat ul"
	
	template_url: "app/resources/templates/categoria.html"
	
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