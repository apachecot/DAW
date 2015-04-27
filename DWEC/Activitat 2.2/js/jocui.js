var jocui = (function () {

		function EmpezarPartida(){
			Tablero.GenerarTableroNuevo(10,10);
			PrintarTablero(Tablero.tablero,Tablero.tableroIds);
			
		}

		function PrintarTablero(tablero,id) {
			$( "#tablero" ).empty();

			for(i=0;i<tablero.length;i++)
			{
				$("#tablero").append("<div id='linea"+i+"' class='linea'></div>");
				for(j=0;j<tablero[i].length;j++)
				{
					if(tablero[i][j].tipo==0)
					{
						$("#linea"+i).append("<div class='cuadrado'><div id='"+id[i][j]+"' class='circulo vacio'></div></div>");
					}
					if(tablero[i][j].tipo==1)
					{
						$("#linea"+i).append("<div class='cuadrado'><div id='"+id[i][j]+"' class='circulo bola1'></div></div>");
					}
					if(tablero[i][j].tipo==2)
					{
						$("#linea"+i).append("<div class='cuadrado'><div id='"+id[i][j]+"' class='circulo bola2'></div></div>");
					}
					if(tablero[i][j].tipo==3)
					{
						$("#linea"+i).append("<div class='cuadrado'><div id='"+id[i][j]+"' class='circulo posible'></div></div>");
					}
				}
			}
			$(".circulo").on("click",jocui.ClickCaja);
	   }
	   function ClickCaja()
	   {
			alert(Tablero.GetCasilla($(this).attr( "id" )).tipo);
			Tablero.BuscarPosicionesLibres(Tablero.GetCasilla($(this).attr( "id" )).tipo);
			PrintarTablero(Tablero.tablero,Tablero.tableroIds);
	   }
	   
	   
	   return {
		  PrintarTablero: PrintarTablero,
		  ClickCaja: ClickCaja,
		  EmpezarPartida: EmpezarPartida
	   }
}());