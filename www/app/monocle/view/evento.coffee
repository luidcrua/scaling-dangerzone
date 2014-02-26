class __View.Evento extends Monocle.View
	
	container: "section#eventos article#artEventos div#listEventos"
	
	template_url: "app/resources/templates/evento.html"
	
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