$(function () {

	// Ajout automatique du porduit choisi au panier en cliquant sur les boutons d'achat.

	$('#cart_block h1 a, button.add_to_cart').on('click', function(e) {

		e.preventDefault();

		var quantity		= 1; // Quantité de produits à insérer dans le panier.
		var idProduct		= 9; // Changer par l'identifiant du produit.
		var idCombination	= 0;

		$.ajax({
			type: 'POST',
			headers: { "cache-control": "no-cache" },
			url: baseUri + '?rand=' + new Date().getTime(),
			async: true,
			cache: false,
			dataType : "json",
			data: 'controller=cart&add=1&ajax=true&qty=' + ((quantity && quantity != null) ? quantity : '1') + '&id_product=' + idProduct + '&token=' + static_token + ( (parseInt(idCombination) && idCombination != null) ? '&ipa=' + parseInt(idCombination): ''),
			success: function(jsonData,textStatus,jqXHR) {
				// Action à effectuer une fois le produit ajouté.
				window.location = window.location.href+"?controller=order";
			},
			error: function(XMLHttpRequest, textStatus, errorThrown) {}
		});
	});

	// Mise en forme de la partie discover via contentbox
	$('#contentboxdiscover ul li').on('click', function(e){
		e.preventDefault();

		var 	imgbg = $(this).find('img').attr('data-full'),
			content = $(this).clone();
			content.find('a').remove();
			content.find('p, h2').wrapAll('<div>');
			content = content.append('<a href="#close" class="close">X</a>');
			content = content.html();

		$('#contentboxdiscover div#full').css('background-image','url('+imgbg+')');
		$('#contentboxdiscover div#full').html(content);
		$('#contentboxdiscover div#full').toggleClass("expand");

		$('#contentboxdiscover div#full a.close').on('click',function(e){
			e.preventDefault();
			$('#contentboxdiscover div#full').toggleClass("expand");
			$('#contentboxdiscover div#full').css('background','black');
		});
	});

	//Mise en place du player

	$('#player').append('<div id="jquery_jplayer_1" class="jp-jplayer"></div><div id="jp_container_1" class="jp-audio"><div class="jp-type-single"><div class="jp-gui jp-interface"><ul class="jp-controls"><div class="jp-title"><ul><li>Non mais allô quoi ? ft B20</li></ul></div><li><a href="javascript:;" class="jp-play" tabindex="1">play</a></li><li><a href="javascript:;" class="jp-pause" tabindex="1">pause</a></li><li><a href="javascript:;" class="jp-stop" tabindex="1">stop</a></li><div class="jp-volume-bar"><div class="jp-volume-bar-value"></div></div><li><a href="javascript:;" class="jp-mute" tabindex="1" title="mute">mute</a></li><li><a href="javascript:;" class="jp-unmute" tabindex="1" title="unmute">unmute</a></li><li><a href="javascript:;" class="jp-volume-max" tabindex="1" title="max volume">max volume</a></li></ul><div class="jp-progress"><div class="jp-seek-bar"><div class="jp-play-bar"></div></div></div><div class="jp-time-holder"><div class="jp-current-time"></div><div class="jp-duration"></div><ul class="jp-toggles"><li><a href="javascript:;" class="jp-repeat" tabindex="1" title="repeat">repeat</a></li><li><a href="javascript:;" class="jp-repeat-off" tabindex="1" title="repeat off">repeat off</a></li></ul></div></div><div class="jp-no-solution"><span>Update Required</span> To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>. </div></div></div>');

	$("#jquery_jplayer_1").jPlayer({

		ready: function () {
		$(this).jPlayer("setMedia", {
			mp3: "./themes/debilla/misc/nabiloose.mp3"
		});
		},
		swfPath: "/jplayer",
		supplied: "mp3"
      	});

	//smooth scroll
	$('header a#contentboxaudio').click(function(e){
		$('html, body').animate({
		    scrollTop: $( $.attr(this, 'href') ).offset().top
		}, 500);
		e.preventDefault();
	});
});