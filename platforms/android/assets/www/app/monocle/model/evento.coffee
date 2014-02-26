class __Model.Evento extends Monocle.Model
	@fields "id", "idCenComercial", "titulo", "imagen", "texto", "fechaEvento", "fecha", "meGusta", "gustaUsuario"
	
	@byCenCom: (cenComercialId) ->
		@select (evento) -> evento.idCenComercial == cenComercialId
	
	@addEvento: (objeto) ->
		buscaEvento = __Model.Evento.findBy "id", parseInt objeto.id
		console.log objeto
		if buscaEvento isnt undefined
			console.log "Ya existía"
		else
			console.log "NO existía"
			# idNotInMemorias.push objeto.id
			idEven = parseInt objeto.id
			idCenComercialEven = parseInt objeto.idCentroComercial
			tituloEven = objeto.titulo
			textoEven = objeto.texto
			imagenEven = "app/resources/images/eventos/" + objeto.imagen
			fechaEventoEven = objeto.fechaEvento
			fechaEven = objeto.fecha
			meGustaEven = 3
			gustaUsuarioEven = "heart-empty"
			__Model.Evento.create id: idEven, idCenComercial: idCenComercialEven, titulo: tituloEven, texto: textoEven, imagen: imagenEven, fechaEvento: fechaEventoEven, fecha: fechaEven, meGusta: meGustaEven, gustaUsuario: gustaUsuarioEven
	
	validate: ->
		unless @titulo
			"titulo es obligatorio"
		unless @imagen
			"imagen es obligatorio"
		unless @id
			"id es obligatorio"