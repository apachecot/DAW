var Events = (function () {
	$(document).ready(function(){
		masterui.SetIntentos();
		 $("#inputText").val(master.TransformarACodigo);
		master.generarCodigoOculto();
		$("#plantillaResult").hide();
		//Clicks en los cuadrados selectores
		 $( ".cuadrado" ).click(function() {
		   circulo=$(this)[0].attributes["bolapadre"].value;
		   $("#"+circulo).removeClass().addClass("circulo").addClass($(this).attr("id"));
		   $("#inputText").val(master.TransformarACodigo);
		});
		//Click en el boton jugar
		$( "#buttonJugar" ).click(function() {
			master.TransformarACodigo();
			masterui.ControlIntentos();
			masterui.MostrarPistasEnLista();
			masterui.BorrarListaPistas();
		});
	});
}());