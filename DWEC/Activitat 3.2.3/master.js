var master = (function () {
		var MAX=6;
		var MIN=1;
		var codigo="";
		var codigoIntento="";
		var contadorOk;
		var contadorKO;
	
		function Jugar()
		{
			if(!$("#error").is(":visible"))
			{
				if(masterui.EstadoPartida()==false)
				{
					masterui.SetIntentos();
					$( "#slider" ).slider({max:($( "#slider" ).slider( "value" ))});
					masterui.EmpezarPartida();
					masterui.MaxIntentos();
					generarCodigoOculto();
					$( "#buttonJugar" ).text("Dame pistas");
				}
				codigoIntento=TransformarACodigo();
				var intentosRestantes=masterui.ControlIntentos();
				masterui.MostrarPistasEnLista();
				masterui.BorrarListaPistas();
				$("#inputText").val("");
				ComprobarEstadoPartida(intentosRestantes);
				if(Config.debug==true){utils.Alert();}
			}
			else
			{
				$("#cajaJuego").effect("shake",{times:3}, 300); 
			}
		}
   
	   function cuantasOk() {
			contadorOk=0;
			for(i=0;i<5;i++)
			{
				if(codigoIntento.toString()[i]==codigo.toString()[i])
				{
					contadorOk++;
				}
			}
			return contadorOk;
	   }
	   
	   function cuantasKO() {
			contadorKO=0;
			for(i=1;i<7;i++)
			{
				if(codigo.indexOf(i.toString())!=-1 && codigoIntento.indexOf(i.toString())!=-1)
				{
					contadorKO++;
				}
			}
			return contadorKO;
		}
		
		function TransformarACodigo() {
			var codigoIntento="";
		   for(i=1;i<6;i++)
			{
				switch($('#circulo'+(i)).attr("class"))
				{
					case "circulo I":
					codigoIntento=codigoIntento.toString()+"1";
					break;
					case "circulo II":
					codigoIntento=codigoIntento.toString()+"2";
					break;
					case "circulo III":
					codigoIntento=codigoIntento.toString()+"3";
					break;
					case "circulo IV":
					codigoIntento=codigoIntento.toString()+"4";
					break;
					case "circulo V":
					codigoIntento=codigoIntento.toString()+"5";
					break;
					case "circulo VI":
					codigoIntento=codigoIntento.toString()+"6";
					break;
					default:
					codigoIntento=codigoIntento.toString()+"0";
					break;
				}
			}
			return codigoIntento;
		}
		
	     
	   function generarCodigoOculto() {
			codigo="";
			for(i=MIN;i<MAX;i++)
			{
				codigo=codigo.toString()+(Math.floor(Math.random() * (MAX - MIN + 1)) + MIN).toString();
			}
	   }
	   function ComprobarEstadoPartida(intentosRestantes)
	   {
			if(contadorOk==5)
			{
				swal({   title: "¡Correcto!",   
				text: "Has conseguido el código completo en "+masterui.GetIntentos()+" intentos.",   
				type: "success"},
				function()
				{   
					location.reload();
				});
			}else{
				if(intentosRestantes==0){
					swal({   title: "¡Fallaste!",   
					text: "No has conseguido descubrir el código",   
					type: "error"},
					function()
					{   
						location.reload();
					});
				}
			}
	   }
	   
	   function GetCodigo()
	   {
			return codigo;
	   }
	   function GetCodigoIntento()
	   {
			return codigoIntento;
	   }
	   function GetOk()
	   {
			return contadorOk;
	   }
	   function GetKO()
	   {
			return contadorKO;
	   }
	   
	   return {
		  generarCodigoOculto: generarCodigoOculto,
		  Jugar: Jugar,
		  GetCodigo: GetCodigo,
		  cuantasKO: cuantasKO,
		  cuantasOk: cuantasOk,
		  GetCodigoIntento: GetCodigoIntento,
		  GetKO: GetKO,
		  GetOk: GetOk,
		  TransformarACodigo: TransformarACodigo,
	   }
}());