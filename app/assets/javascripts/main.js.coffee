# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.snack = (options)->
	document.querySelector("#global-snackbar").MaterialSnackbar.showSnackbar(options)


window.loading = false

$(document).on "turbolinks:load", ()->
	console.log("Estoy dentro")
	componentHandler.upgradeDom();


$(document).on "page:load page:fetch ready", () ->
	
	
	$(".close-parent").on "click", (ev) ->
		$(this).parent().slideUp()

	$("#notification").on "click", (ev) ->
		ev.preventDefault() if $("#notifications").hasClass("active")
		$("#notifications").toggleClass("active")
		return $("#notifications").hasClass("active")
	$('.best_in_place').best_in_place()
	$(".mdl-layout").scroll ->

		if !window.loading && $(".mdl-layout").scrollTop() > $(document).height() - 100
			console.log("cargando...")
			window.loading = true
			url = $(".next_page").attr("href")
			$.getScript url if url
