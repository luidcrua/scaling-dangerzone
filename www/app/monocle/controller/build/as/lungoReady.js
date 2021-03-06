// Generated by CoffeeScript 1.6.3
(function() {
  Lungo.ready(function() {
    $$("body").on("swipeRight", function(event) {
      return Lungo.Router.back();
    });
    ["singleTap", "doubleTap", "hold", "swipe", "-swiping", "swipeLeft", "swipeRight", "swipeUp", "swipeDown", "rotate", "rotateLeft", "rotateRight", "pinch", "pinchIn", "pinchOut", "drag", "dragLeft", "dragRight", "dragUp", "dragDown"].forEach(function(type) {
      return $$("#main-article").on(type, function(event) {
        var liActivo, objLiActivo;
        if (window.plenoCambio !== true) {
          liActivo = Math.floor((document.getElementById("main-article").scrollTop + ($$(".imgGrandes").width() / 3)) / ($$(".imgGrandes").width() / 2));
          $$("#main-article ul li").removeClass("shadow");
          $$("#main-article ul li img").removeClass("noSeleccionada");
          $$("#main-article ul li img").addClass("noSeleccionada");
          console.log(liActivo);
          objLiActivo = $$("#main-article ul").children()[liActivo];
          $$(objLiActivo).children().first().removeClass("noSeleccionada");
          return $$(objLiActivo).addClass("shadow");
        }
      });
    });
    $$('#main-article img').tap(function(event) {
      TweenMax.from($$("#imageBolsas"), 2, {
        bottom: "-100%",
        ease: Expo.easeOut
      });
      TweenMax.from($$("#imageGlobo"), 2, {
        bottom: "-100%",
        ease: Expo.easeOut
      });
      window.cenComercialSel = $$(this).attr('data-title');
      return window.cambioTitulo(window.cenComercialSel);
    });
    /*
    	cargaTituloCenComercial = (event) ->
    		$$('#cenComMenu h1.title').html window.cenComercialSel
    */

    $$('#centroComercial article#layout-art2 div#listCat ul li').tap(function(event) {
      var idCategoria;
      idCategoria = parseInt($$(this).attr('data-id'));
      return window.getComercioXCategoria(idCategoria);
    });
    $$('#subcategorias article#layout-art2 div#list ul li').tap(function(event) {
      var idComercio;
      idComercio = parseInt($$(this).attr('data-id'));
      return getPromoXComercio(idComercio);
    });
    $$('.shareBt').tap(function(event) {
      Lungo.Notification.show();
      return Lungo.Notification.html('<div class="cont-share "><h2>Share</h2>  <ul>  	<li><a href="http://www.facebook.com/sharer/sharer.php?u=http://www.mukuralab.com/appmall/kumbia/aplicacion/index/Santa_fe/Arturo_calle/Vestidos/" target="_blank"><img src="app/resources/images/share-icons/fbk-icon.png"/></a></li>  	<li><a href="https://twitter.com/intent/tweet?text=Mira%20esta%20promo&url=http%3A%2F%2Fwww.mukuralab.com%2Fappmall%2Fkumbia%2Faplicacion%2Findex%2FSanta_fe%2FArturo_calle%2FVestidos%2F" target="_blank"><img src="app/resources/images/share-icons/twt-icon.png"/></a></li>  	<li><img src="app/resources/images/share-icons/pint-icon.png"/></li>  	<li><a href="mailto:?subject=Mira esta promo&body=http://www.mukuralab.com/appmall/kumbia/aplicacion/index/Santa_fe/Arturo_calle/Vestidos/" target="_blank"><img src="app/resources/images/share-icons/email-icon.png"/></a></li>  	<li><img src="app/resources/images/share-icons/gplus-icon.png"/></li>  	<li><img src="app/resources/images/share-icons/noshare-icon.png"/></li>  </ul><img src="app/resources/images/share-icons/close.png" class="close-share"/> </div>');
    });
    $$('.close-share').tap(function(event) {
      return Lungo.Notification.hide();
    });
    $$('.heartLike').tap(function(event) {
      if ($$(this).children().first().hasClass("heart-empty")) {
        $$(this).children().first().removeClass("icon");
        $$(this).children().first().removeClass("heart-empty");
        return $$(this).children().first().addClass("icon heart");
      } else {
        $$(this).children().first().removeClass("icon");
        $$(this).children().first().removeClass("heart");
        return $$(this).children().first().addClass("icon heart-empty");
      }
    });
    $$('.contPost img').tap(function(event) {
      var view;
      $$("#promoInterna").empty();
      view = new __View.PromocionInterna({
        model: __Model.Promocion
      });
      view.append(__Model.Promocion.findBy("id", parseInt($$(this).parent().parent().attr('data-id'))));
      return Lungo.Router.article("almacen2", "interna");
    });
    $$('.imgSuperPromo').tap(function(event) {
      Lungo.Notification.show();
      return $$.post('http://www.mukuralab.com/appmall/kumbia/json/registroSuperPromo', {
        idUsuario: 1,
        idPromocion: 1,
        idComercio: 1,
        idCentroComercial: 1
      }, function(data) {
        console.log(data);
        switch (data.error) {
          case "0":
          case 0:
            return Lungo.Notification.success("Super Promoción", "Tu código es: " + data.codigo, "ok");
          case "2":
          case 2:
            return Lungo.Notification.error("Super Promoción", "Ya tienes un código para esta promoción, es: " + data.codigo, "remove", 5);
          case "1":
          case 1:
            return Lungo.Notification.error("Super Promoción", "Ocurrió un error, intenta nuevamente", "remove");
        }
      });
    });
    __Model.Usuario.create({
      id: 1,
      nombre: "Ropa Masculina"
    });
    __Model.Categoria.create({
      id: 1,
      nombre: "Ropa Masculina",
      visible: true
    });
    __Model.Categoria.create({
      id: 2,
      nombre: "Ropa Femenina",
      visible: true
    });
    return __Model.Promocion.create({
      id: 4,
      idComercio: 2,
      idCenComercial: 2,
      titulo: "Titulo destacado post",
      descripcion: "Descripción de la promoción",
      imagen: "app/resources/images/promos/image3.jpg",
      meGusta: 15,
      fechaInicioPublicacion: "2013-10-14",
      fechaFinPublicacion: "2013-10-19",
      superPromo: false,
      visible: true
    });
  });

}).call(this);
