Lungo.ready ->
	# BACK CON EL SWIPE
	$$("section").on "swipeRight", (event) ->
		Lungo.Router.back();
	
	###
	# EL TEMA DEL SCROLL PARA CUADRAR EL CSS DEL "ELEGIDO"
	["singleTap", "doubleTap", "hold",
	"swipe", "-swiping", "swipeLeft", "swipeRight", "swipeUp", "swipeDown",
	"rotate", "rotateLeft", "rotateRight",
	"pinch", "pinchIn", "pinchOut",
	"drag", "dragLeft", "dragRight", "dragUp", "dragDown"].forEach (type) ->
		$$("#main-article").on type, (event) ->
			if window.plenoCambio isnt true
				# console.log document.getElementById("main-article").scrollTop
				liActivo = Math.floor (document.getElementById("main-article").scrollTop + ($$(".imgGrandes").width() / 3)) / ($$(".imgGrandes").width() / 2)
				$$("#main-article ul li").removeClass "shadow"
				$$("#main-article ul li img").removeClass "noSeleccionada"
				$$("#main-article ul li img").addClass "noSeleccionada"
				# console.log liActivo
				objLiActivo = $$("#main-article ul").children()[liActivo]
				$$(objLiActivo).children().first().removeClass "noSeleccionada"
				$$(objLiActivo).addClass "shadow"
				# console.log $$("#main-article ul").children()[liActivo]
				# window.plenoCambio = true
	###
	# SELECCIÓN DE CENTRO COMERCIAL
	$$('#main-article img').tap (event) ->
		TweenMax.from $$("#imageBolsas"), 2, {bottom:"-100%", ease:Expo.easeOut}
		TweenMax.from $$("#imageGlobo"), 2, {bottom:"-100%", ease:Expo.easeOut}
		window.cenComercialSel = $$(this).attr 'data-title'
		window.cambioTitulo window.cenComercialSel
		window.cambiaIcono window.cenComercialSel
	###
	cargaTituloCenComercial = (event) ->
		$$('#cenComMenu h1.title').html window.cenComercialSel
	###
	# SELECCIÓN DE CATEGORÍAS
	$$('#centroComercial article#layout-art2 div#listCat ul li').tap (event) ->
		idCategoria = parseInt $$(this).attr 'data-id'
		window.getComercioXCategoria idCategoria
	# SELECCIÓN DE COMERCIO
	$$('#subcategorias article#layout-art2 div#list ul li').tap (event) ->
		idComercio = parseInt $$(this).attr 'data-id'
		getPromoXComercio idComercio
	# BOTÓN DE COMPARTIR
	$$('.shareBt').tap (event) ->
		###
		Lungo.Notification.show();
		Lungo.Notification.html '<div class="cont-share "><h2>Share</h2>  <ul>  	<li><a href="http://www.facebook.com/sharer/sharer.php?u=http://www.mukuralab.com/appmall/kumbia/aplicacion/index/Santa_fe/Arturo_calle/Vestidos/" target="_blank"><img src="app/resources/images/share-icons/fbk-icon.png"/></a></li>  	<li><a href="https://twitter.com/intent/tweet?text=Mira%20esta%20promo&url=http%3A%2F%2Fwww.mukuralab.com%2Fappmall%2Fkumbia%2Faplicacion%2Findex%2FSanta_fe%2FArturo_calle%2FVestidos%2F" target="_blank"><img src="app/resources/images/share-icons/twt-icon.png"/></a></li>  	<li><a href="javascript:void((function()%7Bvar%20e=document.createElement(&apos;script&apos;);e.setAttribute(&apos;type&apos;,&apos;text/javascript&apos;);e.setAttribute(&apos;charset&apos;,&apos;UTF-8&apos;);e.setAttribute(&apos;src&apos;,&apos;http://assets.pinterest.com/js/pinmarklet.js?r=&apos;+Math.random()*99999999);document.body.appendChild(e)%7D)());"><img src="app/resources/images/share-icons/pint-icon.png"/></a></li>  	<li><a href="mailto:?subject=Mira esta promo&body=http://www.mukuralab.com/appmall/kumbia/aplicacion/index/Santa_fe/Arturo_calle/Vestidos/" target="_blank"><img src="app/resources/images/share-icons/email-icon.png"/></a></li>  	<li><a href="https://plus.google.com/share?url=http%3A%2F%2Fwww.mukuralab.com%2Fappmall%2Fkumbia%2Faplicacion%2Findex%2FSanta_fe%2FArturo_calle%2FVestidos%2F" target="_blank"><img src="app/resources/images/share-icons/gplus-icon.png"/></a></li>  	<!--li><img src="app/resources/images/share-icons/noshare-icon.png"/></li-->  </ul><img src="app/resources/images/share-icons/close.png" class="close-share"/> </div>'
		###
		Lungo.Aside.show "share"
		nomCenCom = window.cenComercialSel.ucfirst()
		nomComercio = window.comercioSel.nombre.ucfirst()
		nomPromo =  $$(this).parent().siblings("h2").html().ucfirst()
		$$('a[data-action=share]').forEach (linkAside) ->
			# console.log linkAside
			switch $$(linkAside).attr "data-type"
				when "facebook"
					$$(linkAside).attr "href", "http://www.facebook.com/sharer/sharer.php?u=http://www.mukuralab.com/appmall/kumbia/aplicacion/index/" + nomCenCom + "/" + nomComercio + "/" + nomPromo + "/"
				when "twitter"
					$$(linkAside).attr "href", "https://twitter.com/intent/tweet?text=Mira%20esta%20promo&url=http%3A%2F%2Fwww.mukuralab.com%2Fappmall%2Fkumbia%2Faplicacion%2Findex%2F" + nomCenCom + "%2F" + nomComercio + "%2F" + nomPromo + "%2F"
				when "pinterest"
					$$(linkAside).attr "href", "javascript:void((function()%7Bvar%20e=document.createElement(&apos;script&apos;);e.setAttribute(&apos;type&apos;,&apos;text/javascript&apos;);e.setAttribute(&apos;charset&apos;,&apos;UTF-8&apos;);e.setAttribute(&apos;src&apos;,&apos;http://assets.pinterest.com/js/pinmarklet.js?r=&apos;+Math.random()*99999999);document.body.appendChild(e)%7D)());"
				when "mail"
					$$(linkAside).attr "href", "mailto:?subject=Mira esta promo&body=http://www.mukuralab.com/appmall/kumbia/aplicacion/index/" + nomCenCom + "/" + nomComercio + "/" + nomPromo + "/"
				when "gplus"
					$$(linkAside).attr "href", "https://plus.google.com/share?url=http%3A%2F%2Fwww.mukuralab.com%2Fappmall%2Fkumbia%2Faplicacion%2Findex%2F" + nomCenCom + "%2F" + nomComercio + "%2F" + nomPromo + "%2F"
	# BOTÓN CERRAR ASIDE
	$$('.closeAside').tap (event) ->
		Lungo.Aside.hide();
	# BOTÓN DE CERRAR COMPARTIR
	$$('.close-share').tap (event) ->
		Lungo.Notification.hide()
	# BOTÓN DE GUSTAR
	$$('.heartLike').tap (event) ->
		iconoActual = this
		nextState = $$(this).children().first().hasClass "heart-empty"
		promocionId = parseInt $$(this).parent().parent().parent().parent().attr 'data-id'
		actualVotos = parseInt $$(this).siblings().last().html()
		cenComercialId = parseInt window.arreCenComerciales.indexOf window.cenComercialSel
		comercioId = parseInt window.comercioSel.id
		if nextState
			# Confirma el gusto y el corazón
			$$.post 'http://www.mukuralab.com/appmall/kumbia/json/usuarioGustoPromocion',
				{proximoEstado: nextState, error: '1', idUsuarioEnvia: 1, idComercio: comercioId, idCentroComercial: cenComercialId, idPromocion: promocionId},
				(data) ->
					console.log(data.idError)
					if data.idError == "0" or data.idError == 0
						console.log iconoActual
						$$(iconoActual).children().first().removeClass "icon"
						$$(iconoActual).children().first().removeClass "heart-empty"
						$$(iconoActual).children().first().addClass "icon heart"
						actualVotos = actualVotos + 1
						$$(iconoActual).siblings().last().html actualVotos.toString()
		else
			# Retira el gusto y el corazón
			$$.post 'http://www.mukuralab.com/appmall/kumbia/json/usuarioNoGustoPromocion',
				{proximoEstado: nextState, error: '1', idUsuarioEnvia: 1, idComercio: comercioId, idCentroComercial: cenComercialId, idPromocion: promocionId},
				(data) ->
					if data.idError == "0" or data.idError == 0
						$$(iconoActual).children().first().removeClass "icon"
						$$(iconoActual).children().first().removeClass "heart"
						$$(iconoActual).children().first().addClass "icon heart-empty"
						actualVotos = actualVotos - 1
						$$(iconoActual).siblings().last().html actualVotos.toString()
	# DETALLE DE LA PROMOCIÓN
	$$('.contPost img').tap (event) ->
		$$(".promoInterna").empty()
		# console.log $$(this).parent().parent().parent().parent().parent().parent().parent()
		console.log $$(this).closest("section")
		# alert $$(this).closest("section").attr 'id'
		sectionId = $$(this).closest("section").attr 'id'
		switch sectionId
			when "almacen1"
				view = new __View.PromocionInterna model: __Model.Promocion
				view.append __Model.Promocion.findBy "id", parseInt $$(this).parent().parent().attr 'data-id'
				Lungo.Router.article "almacen2", "interna"
			when "eventos"
				###
				view = new __View.EvenDestaInterna model: __Model.Evento
				view.append __Model.Evento.findBy "id", parseInt $$(this).parent().parent().attr 'data-id'
				Lungo.Router.article "almacen3", "evenDestaInterna"
				###
			else
				view = new __View.EvenDestaInterna model: __Model.Promocion
				view.append __Model.Promocion.findBy "id", parseInt $$(this).parent().parent().attr 'data-id'
				Lungo.Router.article "almacen3", "evenDestaInterna"
		###
		if sectionId isnt "almacen1"
			view = new __View.EvenDestaInterna model: __Model.Promocion
			view.append __Model.Promocion.findBy "id", parseInt $$(this).parent().parent().attr 'data-id'
			Lungo.Router.article "almacen3", "evenDestaInterna"
		else
			view = new __View.PromocionInterna model: __Model.Promocion
			view.append __Model.Promocion.findBy "id", parseInt $$(this).parent().parent().attr 'data-id'
			Lungo.Router.article "almacen2", "interna"
		###
	# BOTÓN DE SÚPER PROMO
	$$('.btnSuperPromo').tap (event) ->
		# Show loading screen
		Lungo.Notification.show()
		cenComercialId = parseInt window.arreCenComerciales.indexOf window.cenComercialSel
		comercioId = parseInt window.comercioSel.id
		promoId = parseInt $$(this).parent().parent().attr 'data-id'
		console.log {idUsuario: 1, idComercio: parseInt window.comercioSel.id, idCentroComercial: cenComercialId, idPromocion: parseInt promoId}
		# Los trae del servidor
		$$.post 'http://www.mukuralab.com/appmall/kumbia/json/registroSuperPromo',
			{idUsuario: 1, idCentroComercial: cenComercialId, idPromocion: promoId, idComercio: comercioId},
			(data) ->
				console.log(data);
				# alert data.idError
				switch data.idError
					when "0", 0
						Lungo.Notification.show()
						window.setTimeout(window.changeSuperPromo,300);
						Lungo.Notification.success "Super Promoción",
							"Tu código es: #{data.codigo}",
							"ok",
							0
					when "2", 2
						Lungo.Notification.show()
						window.setTimeout(window.changeSuperPromo,300);
						Lungo.Notification.success "Super Promoción",
							"Ya tienes un código para esta promoción, es: #{data.codigo}",
							"ok",
							0
					when "1", 1
						Lungo.Notification.show()
						Lungo.Notification.error "Super Promoción",
							"Ocurrió un error, intenta nuevamente",
							"remove",
							0
	# BOTÓN DE DESTACADOS
	# $$('a[data-label=Destacados]').tap (event) ->
	# $$('#btnDestacados').tap (event) ->
	["a[data-label=Destacados]", "#btnDestacados"].forEach (linkType) ->
		$$(linkType).tap (event) ->
			# Borra los actuales
			$$('section#destacados article#artDestacados div#listDestacados').empty()
			promoPorComercio = __Model.Promocion.byComercioCenCom 1, 1
			console.log(promoPorComercio);
			# lng.Core.findByProperty(promoPorComercio, 'name', 'asc');
			# Show loading screen
			Lungo.Notification.show()
			# Los trae del servidor
			cenComercialId = parseInt window.arreCenComerciales.indexOf window.cenComercialSel
			$$.post 'http://www.mukuralab.com/appmall/kumbia/json/promocionDestacada/' + cenComercialId.toString(),
				{error: 1},
				(data) ->
					console.log data
					Lungo.Notification.hide()
					for promo in data
						do (promo) ->
							__Model.Promocion.addPromocion promo
							view = new __View.Destacado model: __Model.Promocion
							view.append __Model.Promocion.findBy "id", parseInt promo.id
					Lungo.Router.section "destacados"
	# BOTÓN DE EVENTOS
	# $$('a[data-label=Eventos]').tap (event) ->
	# $$('#btnEventos').tap (event) ->
	["a[data-label=Eventos]", "#btnEventos"].forEach (linkType) ->
		$$(linkType).tap (event) ->
			# Borra los actuales
			$$('section#eventos article#artEventos div#listEventos').empty()
			# lng.Core.findByProperty(promoPorComercio, 'name', 'asc');
			# Show loading screen
			Lungo.Notification.show()
			# Los trae del servidor
			cenComercialId = parseInt window.arreCenComerciales.indexOf window.cenComercialSel
			$$.post 'http://www.mukuralab.com/appmall/kumbia/json/eventoCentroComercial/' + cenComercialId.toString(),
				{error: 1},
				(data) ->
					console.log data
					Lungo.Notification.hide()
					for evento in data
						do (evento) ->
							__Model.Evento.addEvento evento
							view = new __View.Evento model: __Model.Evento
							view.append __Model.Evento.findBy "id", parseInt evento.id
					Lungo.Router.section "eventos"
	
	__Model.Usuario.create id:1, nombre: "Ropa Masculina"
	__Model.Categoria.create id:1, nombre: "Ropa Masculina", visible: true
	__Model.Categoria.create id:2, nombre: "Ropa Femenina", visible: true
	__Model.Categoria.create id:3, nombre: "Ropa infantil", visible:true
	__Model.Categoria.create id:4, nombre: "Mascotas", visible:true
	__Model.Categoria.create id:5, nombre: "Cinemas", visible:true
	__Model.Categoria.create id:6, nombre: "Juguetes", visible:true
	__Model.Categoria.create id:7, nombre: "Variedades", visible:true
	__Model.Categoria.create id:8, nombre: "Comidas", visible:true
	__Model.Categoria.create id:9, nombre: "Tecnologia", visible:true
	__Model.Categoria.create id:10, nombre: "Música", visible:false
	# Destacados
	__Model.Promocion.create id:404, idComercio: 2, idCenComercial: 2, titulo: "Titulo destacado post", descripcion: "Descripción de la promoción", imagen: "app/resources/images/promos/image3.jpg", meGusta: 15, fechaInicioPublicacion: "2013-12-14", fechaFinPublicacion: "2014-01-21", gustaUsuario: "heart-empty", superPromo: false, cantidad: 3, promoDestacada: false, visible: true
	__Model.Promocion.create id:405, idComercio: 1, idCenComercial: 1, titulo: "Destacado 1", descripcion: "Tienda 2", imagen: "app/resources/images/promos/destacados1.jpg", meGusta: 28, fechaInicioPublicacion: "2014-01-14", fechaFinPublicacion: "2014-01-19", gustaUsuario: "heart-empty", superPromo: false, cantidad: 3, promoDestacada: false, visible: true
	__Model.Promocion.create id:406, idComercio: 1, idCenComercial: 1, titulo: "Destacado 2", descripcion: "Tienda 4", imagen: "app/resources/images/promos/destacados2.jpg", meGusta: 28, fechaInicioPublicacion: "2014-01-14", fechaFinPublicacion: "2014-01-19", gustaUsuario: "heart-empty", superPromo: false, cantidad: 3, promoDestacada: false, visible: true
	__Model.Promocion.create id:407, idComercio: 1, idCenComercial: 1, titulo: "Destacado 3", descripcion: "Tienda 1", imagen: "app/resources/images/promos/destacados3.jpg", meGusta: 28, fechaInicioPublicacion: "2014-01-14", fechaFinPublicacion: "2014-01-19", gustaUsuario: "heart-empty", superPromo: false, cantidad: 3, promoDestacada: false, visible: true
	__Model.Promocion.create id:408, idComercio: 1, idCenComercial: 1, titulo: "Destacado 4", descripcion: "Tienda 3", imagen: "app/resources/images/promos/destacados4.jpg", meGusta: 28, fechaInicioPublicacion: "2014-01-14", fechaFinPublicacion: "2014-01-19", gustaUsuario: "heart-empty", superPromo: false, cantidad: 3, promoDestacada: false, visible: true
	# Eventos
	__Model.Promocion.create id:409, idComercio: 1, idCenComercial: 1, titulo: "Evento 1", descripcion: "", imagen: "app/resources/images/eventos/eventos1.jpg", meGusta: 4, fechaInicioPublicacion: "2014-01-14", fechaFinPublicacion: "2014-01-19", gustaUsuario: "heart-empty", superPromo: false, cantidad: 3, promoDestacada: false, visible: true
	__Model.Promocion.create id:4010, idComercio: 1, idCenComercial: 1, titulo: "Evento 2", descripcion: "", imagen: "app/resources/images/eventos/eventos2.jpg", meGusta: 11, fechaInicioPublicacion: "2014-01-14", fechaFinPublicacion: "2014-01-19", gustaUsuario: "heart-empty", superPromo: false, cantidad: 3, promoDestacada: false, visible: true
	__Model.Promocion.create id:4011, idComercio: 1, idCenComercial: 1, titulo: "Evento 3", descripcion: "", imagen: "app/resources/images/eventos/eventos3.jpg", meGusta: 12, fechaInicioPublicacion: "2014-01-14", fechaFinPublicacion: "2014-01-19", gustaUsuario: "heart-empty", superPromo: false, cantidad: 3, promoDestacada: false, visible: true
	__Model.Promocion.create id:4012, idComercio: 1, idCenComercial: 1, titulo: "Evento 4", descripcion: "", imagen: "app/resources/images/eventos/eventos4.jpg", meGusta: 15, fechaInicioPublicacion: "2014-01-14", fechaFinPublicacion: "2014-01-19", gustaUsuario: "heart-empty", superPromo: false, cantidad: 3, promoDestacada: false, visible: true
	
	__Model.UserData.getUserData()