var joc = (function () {
		
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
				Config.bola2amigasbola2=$("#inputTextBola2CercanaBola2").val();
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
				Ficha.ComprobarEstados();
				jocui.PrintarTablero(Tablero.tablero,Tablero.tableroIds);
			}
			else{
				$("#error").effect("shake",{times:3}, 300); 
				$("#errorFilas").effect("shake",{times:3}, 300); 
			}
			
		}
		function EmpezarPartidaAleatorio()
		{
			$("#inputTextBola1CercanaBola1").val(Math.floor(Math.random() * 4)+1);
			$("#inputTextBola1CercanaBola2").val(Math.floor(Math.random() * 4)+1);
			$("#inputTextBola2CercanaBola1").val(Math.floor(Math.random() * 4)+1);
			$("#inputTextBola2CercanaBola2").val(Math.floor(Math.random() * 4)+1);
			$("#inputTextFilas").val(10);
			$("#inputTextColumnas").val(10);
			EmpezarPartida();
		}
		
		function CapturarCajaRapidaCercanas(m){
		
			  var expreg = new RegExp("^[012345]$");
			  var keycode = (event.keyCode ? event.keyCode : event.which);
							  
			  if(expreg.test(m)){
					$("#error").hide();
				}else{
					$("#error").show();
				}
		}
		function CapturarCajaRapidaFilasColumnas(m){
		
			  var expreg = new RegExp("^[0123456789]{1,2}$");
			  var keycode = (event.keyCode ? event.keyCode : event.which);
							  
			  if(expreg.test(m)){
					$("#errorFilas").hide();
				}else{
					$("#errorFilas").show();
				}
		}
		function MensajeCorrecto()
		{
			swal({   title: "¡Conseguido!",   
				text: "Has logrado vencer a la segregación social, ahora todos estan contentos",   
				type: "success"}
			);
		}
		function MensajeIncorrecto()
		{
			swal({   title: "¡Vaya...!",   
					text: "No hay más posibles movimientos",   
					type: "error"}
					);
		}
	   
	   
	   return {
			EmpezarPartida: EmpezarPartida,
			EmpezarPartidaAleatorio: EmpezarPartidaAleatorio,
			CapturarCajaRapidaCercanas: CapturarCajaRapidaCercanas,
			MensajeCorrecto: MensajeCorrecto,
			MensajeIncorrecto: MensajeIncorrecto
		 
	   }
}());