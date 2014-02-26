class PromocionCtrl extends Monocle.Controller
	
	elements:
		"header a[data-action=follow]": "follow"
		"footer a:first-child": "pending"
		"footer a:last-child": "finished"
	
	constructor: ->
		super
		# __Model.Promocion.bind "create", @bindPromocionCreate
		# __Model.Promocion.bind "change", @bindPromocionChange
	
	events:
        "click a[data-action=follow]": "onFollow"
	
	onFollow: (event) =>
		nextState = Lungo.dom("header a[data-action=follow] span:first-child").hasClass "star-empty"
		cenComercialId = parseInt window.arreCenComerciales.indexOf window.cenComercialSel
		comercioId = parseInt window.comercioSel.id
		if nextState
			# Confirma el gusto y la estrella
			Lungo.Notification.show()
			window.setTimeout(window.changeHabeasData,300);
			Lungo.Notification.confirm 
				icon: 'comment',
				title: 'Suscripción',
				description: '¿Acepta ser contactado por este establecimiento para informarle de nuevas promociones y nuevos productos?',
				accept: {
					icon: 'checkmark',
					label: 'Acepto',
					callback: ()->
						$$.post 'http://www.mukuralab.com/appmall/kumbia/json/usuarioGustoLocal',
							{proximoEstado: nextState, error: '1', idUsuarioEnvia: 1, idComercio: comercioId, idCentroComercial: cenComercialId},
							(data) ->
								console.log(data.idError)
								if data.idError == "0" or data.idError == 0
									Lungo.dom("header a[data-action=follow] span:first-child").removeClass "icon"
									Lungo.dom("header a[data-action=follow] span:first-child").removeClass "star-empty"
									Lungo.dom("header a[data-action=follow] span:first-child").addClass "icon star"
				},
				cancel: {
					icon: 'close',
					label: 'Cancelar',
					callback: ()->
						# alert "No!"
				}
			###
			$$(".window .confirm .show").children().first().empty()
			$$(".window .confirm .show").children().first().html "<img src='app/resources/images/imagen-contacto.png'/>"
			###
		else
			# Retira el gusto y la estrella
			$$.post 'http://www.mukuralab.com/appmall/kumbia/json/usuarioNoGustoLocal',
				{proximoEstado: nextState, error: '1', idUsuarioEnvia: 1, idComercio: comercioId, idCentroComercial: cenComercialId},
				(data) ->
					if data.idError == "0" or data.idError == 0
						Lungo.dom("header a[data-action=follow] span:first-child").removeClass "icon"
						Lungo.dom("header a[data-action=follow] span:first-child").removeClass "star"
						Lungo.dom("header a[data-action=follow] span:first-child").addClass "icon star-empty"
		console.log "FOLLOW"
	
	bindPromocionCreate: (comercio) =>
		# console.error "añadido el promocion", promocion
		view = new __View.Promocion model: promocion
		view.append promocion
	
	bindPromocionChange: (comercio) =>
		console.error "alguien ha actualizado el promocion ", promocion
		promociones = __Model.Promocion
		# Lungo.View.Element.count @pending.selector, categorias.pending().length
		Lungo.Element.count @pending.selector, categorias.pending().length
		# Lungo.Element.count @finished.selector, categorias.finished().length
	
__Controller.list = new PromocionCtrl "section#almacen1"

# Lungo.ready ->
# 	__Model.Comercio.create id: "1", name: "Tarea 1", description: "Lorem"
# 	__Model.Categoria.create name: "Tarea 2", description: "Lorem"
# 	__Model.Categoria.create name: "Tarea 3", description: "Lorem"