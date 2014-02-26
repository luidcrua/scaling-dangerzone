class __Model.Promocion extends Monocle.Model
	@fields "id", "idComercio", "idCenComercial", "titulo", "imagen", "descripcion", "fechaInicioPublicacion", "fechaFinPublicacion", "gustaUsuario", "meGusta", "superPromo", "cantidad", "promoDestacada", "visible", "fecha", "nombreComercio"
	
	@pending: ->
		@select (promocion) -> !promocion.visible
	
	@finished: ->
		@select (promocion) -> !!promocion.visible
	
	@byComercio: (comercioId) ->
		@select (promocion) -> promocion.idComercio == comercioId
	
	@byComercioCenCom: (comercioId, cenComercialId) ->
		@select (promocion) -> promocion.idComercio == comercioId && promocion.idCenComercial == cenComercialId
	
	@addPromocion: (objeto) ->
		buscaPromocion = __Model.Promocion.findBy "id", parseInt objeto.id
		console.log objeto
		# numPromocion = buscaPromocion.length
		# if numPromocion isnt 0
		if buscaPromocion isnt undefined
			console.log "Ya existía"
		else
			console.log "NO existía"
			# idNotInMemorias.push objeto.id
			idProm = parseInt objeto.id
			idComercioProm = parseInt objeto.idComercio
			idCenComercialProm = parseInt objeto.idCentroComercial
			tituloProm = objeto.titulo
			descripcionProm = objeto.descripcion
			imagenProm = "app/resources/images/promos/" + objeto.imagen
			gustaUsuarioProm = "heart-empty" # ((data.items[i].gustaUsuario == "0") || (data.items[i].gustaUsuario == 0)) ? "heart-empty" : "heart",
			meGustaProm = "3"
			fechaInicioPublicacionProm = objeto.fechaInicioPublicacionProm
			fechaFinPublicacionProm = objeto.fechaFinPublicacionProm
			superPromoProm = if objeto.superPromo == "S" then true else false
			cantidadProm = parseInt objeto.cantidad
			promoDestacadaProm = if objeto.promoDestacada == "S" then true else false
			visibleProm = if objeto.visible == "S" then true else false
			# nombreComercioProm = __Model.Comercio.findBy "id", parseInt objeto.idComercio
			__Model.Promocion.create id: idProm, idComercio: idComercioProm, idCenComercial: idCenComercialProm, titulo: tituloProm, descripcion: descripcionProm, imagen: imagenProm, meGusta: meGustaProm, fechaInicioPublicacion: fechaInicioPublicacionProm, fechaFinPublicacion: fechaFinPublicacionProm, gustaUsuario: gustaUsuarioProm, superPromo: superPromoProm, cantidad: cantidadProm, promoDestacada: promoDestacadaProm, visible: visibleProm #, nombreComercio: nombreComercioProm.nombre
	
	validate: ->
		unless @titulo
			"titulo es obligatorio"
		unless @imagen
			"imagen es obligatorio"
		unless @id
			"id es obligatorio"