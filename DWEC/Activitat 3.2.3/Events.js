var Events = (function () {
	$(document).ready(function(){
		masterui.SetSlider();
		//Clicks en los cuadrados selectores
		 $( ".cuadrado" ).on("click",masterui.ClickCajas);
		//Click en el boton jugar
		$( "#buttonJugar" ).on("click",master.Jugar);
		//Introducir datos textarea
		$("#inputText").on("keyup",masterui.CapturarCajaRapida); 
	});
}());