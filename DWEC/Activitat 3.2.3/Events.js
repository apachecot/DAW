$(document).ready(function(){
	 $( ".cuadrado" ).click(function() {
	   circulo=$(this)[0].attributes["bolapadre"].value;
	   $("#"+circulo).removeClass().addClass("circulo").addClass($(this).attr("id"));
	});
});