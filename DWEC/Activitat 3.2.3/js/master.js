var master = (function () {
		var MAX=6;
		var MIN=1;
		var codigo="";
		var codigoIntento="";
		var codigoIntentoOk="";
		var codigoSecretoOk="";
		var contadorOk;
		var contadorKO;
	
		function Jugar()
		{
			if(!$("#error").is(":visible"))
			{
				if(masterui.EstadoPartida()==false)
				{
					masterui.SetIntentos(0);
					$( "#slider" ).slider({max:($( "#slider" ).slider( "value" ))});
					$("#pIntentos").text("Número restante de intentos");
					masterui.EmpezarPartida();
					masterui.MaxIntentosSlider();
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
				$("#error").effect("shake",{times:3}, 300); 
			}
		}
   
	   function cuantasOk() {
			contadorOk=0;
			codigoIntentoOk=codigoIntento;
			codigoSecretoOk=codigo;
			i=0;
			while (i<codigoSecretoOk.length)
			{
				if(codigoIntentoOk.toString()[i]==codigoSecretoOk.toString()[i])
				{
					contadorOk++;
					codigoIntentoOk=codigoIntentoOk.slice(0, i) + codigoIntentoOk.slice(i+1);
					codigoSecretoOk=codigoSecretoOk.slice(0, i) + codigoSecretoOk.slice(i+1);
				}else{
					i++;
				}
			}
			return contadorOk;
	   }
	   
	   function cuantasKO() {
			contadorKO=0;
			i=0;
			while(i<codigoSecretoOk.length)
			{
				if(codigoIntentoOk.indexOf(codigoSecretoOk[i])!=-1 )
				{
					posicionBorrar=codigoIntentoOk.indexOf(codigoSecretoOk[i]);
					contadorKO++;
					codigoIntentoOk=codigoIntentoOk.slice(0, posicionBorrar) + codigoIntentoOk.slice(posicionBorrar+1);
				}
				i++;
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
			if(Config.codigoAutomatico==false)
			{
				for(i=MIN;i<MAX;i++)
				{
					codigo=codigo.toString()+(Math.floor(Math.random() * (MAX - MIN + 1)) + MIN).toString();
				}
			}else{
				codigo=Config.codigoPrueba;
			}
	   }
	   
	   function CargarcodigoOculto(codigoLocal) {
			codigo=codigoLocal;
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
				utils.GuardarLocalStorage(false);
			}else{
				if(intentosRestantes<=0){
					swal({   title: "¡Fallaste!",   
					text: "No has conseguido descubrir el código",   
					type: "error"},
					function()
					{   
						location.reload();
					});
					utils.GuardarLocalStorage(false);
				}else{
					utils.GuardarLocalStorage(true);
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
	   function SetUltimoIntento(ultimoIntento)
	   {
			codigoIntento=ultimoIntento;
	   }
	   
	   
	   return {
		  generarCodigoOculto: generarCodigoOculto,
		  CargarcodigoOculto: CargarcodigoOculto,
		  Jugar: Jugar,
		  GetCodigo: GetCodigo,
		  cuantasKO: cuantasKO,
		  cuantasOk: cuantasOk,
		  GetCodigoIntento: GetCodigoIntento,
		  GetKO: GetKO,
		  GetOk: GetOk,
		  TransformarACodigo: TransformarACodigo,
		  SetUltimoIntento: SetUltimoIntento
	   }
}());