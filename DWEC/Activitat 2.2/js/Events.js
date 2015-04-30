var Events = (function () {
		$(document).ready(function(){
		$( "#buttonJugar" ).on("click",jocui.EmpezarPartida);
	});

	   function ClickInfeliz()
	   {
			Tablero.casillaPulsada=$(this).attr( "id" );
			Tablero.LimpiarPosibilidades();
			Tablero.BuscarPosicionesLibres(Tablero.GetCasilla($(this).attr( "id" )).tipo);
			jocui.PrintarTablero(Tablero.tablero,Tablero.tableroIds);
	   }
	   function ClickPosible()
	   {
			Tablero.CambiarPosicion($(this).attr( "id" ));
			Tablero.LimpiarPosibilidades();
			Tablero.ComprobarEstados();
			jocui.PrintarTablero(Tablero.tablero,Tablero.tableroIds);
	   }
	   
	   return {
	   
			ClickInfeliz: ClickInfeliz,
			ClickPosible: ClickPosible
	   }
}());