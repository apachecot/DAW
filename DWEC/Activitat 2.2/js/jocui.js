var jocui = (function () {

		

		function PrintarTablero(tablero,id) {
			$( "#tablero" ).empty();

			for(i=0;i<tablero.length;i++)
			{
				$("#tablero").append("<div id='linea"+i+"' class='linea'></div>");
				for(j=0;j<tablero[i].length;j++)
				{
					if(tablero[i][j].tipo==0)
					{
						$("#linea"+i).append("<div class='cuadrado'><div id='"+id[i][j]+"' class='circulo vacio '></div></div>");
					}
					if(tablero[i][j].tipo==1)
					{
						$("#linea"+i).append("<div class='cuadrado'><div id='"+id[i][j]+"' class='circulo bola1 "+tablero[i][j].contenta+"'></div></div>");
					}
					if(tablero[i][j].tipo==2)
					{
						$("#linea"+i).append("<div class='cuadrado'><div id='"+id[i][j]+"' class='circulo bola2 "+tablero[i][j].contenta+"'></div></div>");
					}
					if(tablero[i][j].tipo==3)
					{
						$("#linea"+i).append("<div class='cuadrado'><div id='"+id[i][j]+"' class='circulo posible'></div></div>");
					}
				}
			}
			$(".infeliz").on("click",Events.ClickInfeliz);
			$(".posible").on("click",Events.ClickPosible);
	   }
	   
	   
	   
	   
	   
	   return {
		  PrintarTablero: PrintarTablero
		  
	   }
}());