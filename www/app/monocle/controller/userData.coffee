class __Model.UserData
	@getUserData: ->
		# Lungo.Data.Storage.persistent "userInfo", null
		userInfo = Lungo.Data.Storage.persistent "userInfo"
		if userInfo isnt null && userInfo.idUsuario isnt null
			console.log "TARAS"
			console.log userInfo
			userInfo.name
		else
			console.log "PAL REGISTRO"
			Lungo.Router.section "registro"