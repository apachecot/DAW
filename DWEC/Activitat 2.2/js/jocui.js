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
						$("#linea"+i).append("<div class='cuadrado'><div id='"+id[i][j]+"' class='circulo bola1 "+tablero[i][j].contenta+"' draggable='true' ondragstart='start(event)' ondragend='end(event)'></div></div>");
					}
					if(tablero[i][j].tipo==2)
					{
						$("#linea"+i).append("<div class='cuadrado'><div id='"+id[i][j]+"' class='circulo bola2 "+tablero[i][j].contenta+"' draggable='true' ondragstart='start(event)' ondragend='end(event)'></div></div>");
					}
					if(tablero[i][j].tipo==3)
					{
						$("#linea"+i).append("<div class='cuadrado'><div id='"+id[i][j]+"' class='circulo posible' ondragenter='return enter(event)' ondragover='return over(event)' ondrop='return drop(event)'></div></div>");
					}
				}
			}
			$(".infeliz").on("mousedown",Events.ClickInfeliz);
	   }
	   
	   
	   
	   
	   
	   return {
		  PrintarTablero: PrintarTablero
		  
	   }
}());