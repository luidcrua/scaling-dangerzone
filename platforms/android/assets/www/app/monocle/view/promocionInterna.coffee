class __View.PromocionInterna extends Monocle.View
	
	container: "section#almacen2 article#interna .promoInterna"
	
	template_url: "app/resources/templates/promocionInterna.html"
	
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