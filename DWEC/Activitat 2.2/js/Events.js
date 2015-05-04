var Events = (function () {
		$(document).ready(function(){
		$( "#buttonJugar" ).on("click",joc.EmpezarPartida);
		$( "#buttonJugarAleatorio" ).on("click",joc.EmpezarPartidaAleatorio);
	});

	   function ClickInfeliz()
	   {
			Tablero.casillaPulsada=$(this).attr( "id" );
			Tablero.LimpiarPosibilidades();
			if(Ficha.BuscarPosicionesLibres(Tablero.GetCasilla($(this).attr( "id" )).tipo)==0)
			{
				joc.MensajeIncorrecto();
			}
			jocui.PrintarTablero(Tablero.tablero,Tablero.tableroIds);
	   }
	   function ClickPosible()
	   {
			Ficha.CambiarPosicion($(this).attr( "id" ));
			Tablero.LimpiarPosibilidades();
			Ficha.ComprobarEstados();
			jocui.PrintarTablero(Tablero.tablero,Tablero.tableroIds);
			if(Ficha.nInfelices==0)
			{
				joc.MensajeCorrecto();
			}
	   }

	   
	   return {
	   
			ClickInfeliz: ClickInfeliz,
			ClickPosible: ClickPosible
	   }
}());