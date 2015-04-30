var jocui = (function () {

		function EmpezarPartida(){
			CapturarCajaRapidaCercanas($("#inputTextBola1CercanaBola1").val());
			Config.bola1amigasbola1=$("#inputTextBola1CercanaBola1").val();
			if(!$("#error").is(":visible"))
			{
				CapturarCajaRapidaCercanas($("#inputTextBola1CercanaBola2").val());
				Config.bola1amigasbola2=$("#inputTextBola1CercanaBola2").val();
			}
			if(!$("#error").is(":visible"))
			{
				CapturarCajaRapidaCercanas($("#inputTextBola2CercanaBola1").val());
				Config.bola2amigasbola1=$("#inputTextBola2CercanaBola1").val();
			}
			if(!$("#error").is(":visible"))
			{
				CapturarCajaRapidaCercanas($("#inputTextBola2CercanaBola2").val());
				Config.bola2amigasbola1=$("#inputTextBola2CercanaBola2").val();
			}
			CapturarCajaRapidaFilasColumnas($("#inputTextFilas").val());
			Config.filas=$("#inputTextFilas").val();
			if(!$("#errorFilas").is(":visible"))
			{
				CapturarCajaRapidaFilasColumnas($("#inputTextColumnas").val());
				Config.columnas=$("#inputTextColumnas").val();
			}
			if(!$("#error").is(":visible") && !$("#errorFilas").is(":visible"))
			{
				Tablero.GenerarTableroNuevo(Config.filas,Config.columnas);
				Tablero.ComprobarEstados();
				PrintarTablero(Tablero.tablero,Tablero.tableroIds);
			}
			else{
				$("#error").effect("shake",{times:3}, 300); 
				$("#errorFilas").effect("shake",{times:3}, 300); 
			}
			
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
	   
	   function CapturarCajaRapidaCercanas(m){
		
			  var expreg = new RegExp("^[12345]$");
			  var keycode = (event.keyCode ? event.keyCode : event.which);
							  
			  if(expreg.test(m)){
					$("#error").hide();
				}else{
					$("#error").show();
				}
		}
		function CapturarCajaRapidaFilasColumnas(m){
		
			  var expreg = new RegExp("^[0123456789]{1,3}$");
			  var keycode = (event.keyCode ? event.keyCode : event.which);
							  
			  if(expreg.test(m)){
					$("#errorFilas").hide();
				}else{
					$("#errorFilas").show();
				}
		}
	   
	   
	   
	   return {
		  EmpezarPartida: EmpezarPartida,
		  PrintarTablero: PrintarTablero,
		  EmpezarPartida: EmpezarPartida,
		  CapturarCajaRapidaCercanas: CapturarCajaRapidaCercanas
	   }
}());