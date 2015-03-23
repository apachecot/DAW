var masterui = (function () {

		var intentos;
		var partida_empezada=false;
		var MAX_INTENTOS;
		

		function EstadoPartida()
		{
			return partida_empezada;
		}
		function EmpezarPartida()
		{
			partida_empezada=true;
		}
		function MaxIntentosSlider()
		{
			MAX_INTENTOS=$( "#slider" ).slider( "value" );
		}
		function MaxIntentosStorage(intentosLocal)
		{
			MAX_INTENTOS=intentosLocal;
		}
		function GetMaxIntentos()
		{
			return MAX_INTENTOS;
		}
		
   
	   function MostrarPistasEnLista() {
			$( "#plantillaResult" ).clone().attr('id', 'result'+(intentos) ).prependTo( "#resultados" );
			var codigo=master.GetCodigo().split('');
			var aciertos=master.cuantasOk();
			var ko=master.cuantasKO();
			ko=ko+aciertos;
			
			for(i=1;i<6;i++)
			{
				$("#result"+(intentos)).find("#circuloResultado"+(i)).removeClass().addClass($('#circulo'+(i)).attr("class"));
				if(aciertos>=i)
				{
					$("#result"+(intentos)).find("#circuloComprobante"+(i)).removeClass().addClass("circulo ok");
				}else{
					if(ko>=i)
					{
					$("#result"+(intentos)).find("#circuloComprobante"+(i)).removeClass().addClass("circulo ko");
					}else{
					$("#result"+(intentos)).find("#circuloComprobante"+(i)).removeClass().addClass("circulo no");
					}
				}
			}
			$("#result"+(intentos)).find("p.numero").html(intentos);
			$("#resultados").children().fadeIn("slow");
	   }
	   
	   function BorrarListaPistas() {
	   
		   for(i=1;i<6;i++)
			{
				$("#circulosJuego").find("#circulo"+(i)).removeClass().addClass("no circulo");
			}
	   
	   }
	   function ControlIntentos()
	   {
			intentos=intentos+1;
			//Contador de intentos central
			$("#contadorCentral").html(intentos+1);
			//Restador de intentos slider
			$(".col-md-4.column").find("p.numero").html(MAX_INTENTOS-intentos);
			$( "#slider" ).slider({value:(MAX_INTENTOS-intentos)});
			return (MAX_INTENTOS-intentos);
	   }
	   function SetIntentos(nintentos)
	   {
			intentos=nintentos;
	   }
	   function GetIntentos()
	   {
			return intentos;
	   }
	   function CapturarCajaRapida(){
		
			  var m = $("#inputText").val();
			  var expreg = new RegExp("^[0-6]{0,5}$");
			  var keycode = (event.keyCode ? event.keyCode : event.which);
							  
			  if(expreg.test(m)){
					TransformarAColores(m);
					$("#error").hide();
				}else{
					$("#error").show();
				}
		}
		function TransformarAColores(codigoColor) {
		   for(i=0;i<5;i++)
			{
				switch(codigoColor.toString()[i])
				{
					case "0":
					$("#circulosJuego").find("#circulo"+(i+1)).removeClass().addClass("no circulo");
					break;
					case "1":
					$("#circulosJuego").find("#circulo"+(i+1)).removeClass().addClass("circulo I");
					break;
					case "2":
					$("#circulosJuego").find("#circulo"+(i+1)).removeClass().addClass("circulo II");
					break;
					case "3":
					$("#circulosJuego").find("#circulo"+(i+1)).removeClass().addClass("circulo III");
					break;
					case "4":
					$("#circulosJuego").find("#circulo"+(i+1)).removeClass().addClass("circulo IV");
					break;
					case "5":
					$("#circulosJuego").find("#circulo"+(i+1)).removeClass().addClass("circulo V");
					break;
					case "6":
					$("#circulosJuego").find("#circulo"+(i+1)).removeClass().addClass("circulo VI");
					break;
					default:
					$("#circulosJuego").find("#circulo"+(i+1)).removeClass().addClass("no circulo");
					break;
				}
			}
		}
		function ClickCajas()
		{
			circulo=$(this)[0].attributes["bolapadre"].value;
			$("#"+circulo).removeClass().addClass("circulo").addClass($(this).attr("id"));
			$("#inputText").val(master.TransformarACodigo);
		}
		function SetSlider(){
			$( "#slider" ).slider({
			  value:10,
			  min: 0,
			  max: 20,
			  step: 1,
			  slide: function( event, ui ) {
				$( "#numeroIntentos" ).text(ui.value);
			  }
			});
			$( "#numeroIntentos" ).text($( "#slider" ).slider( "value" ));
		}
	   return {
		  MostrarPistasEnLista: MostrarPistasEnLista,
		  BorrarListaPistas: BorrarListaPistas,
		  ControlIntentos: ControlIntentos,
		  SetIntentos: SetIntentos,
		  GetIntentos: GetIntentos,
		  GetMaxIntentos: GetMaxIntentos,
		  EstadoPartida: EstadoPartida,
		  EmpezarPartida: EmpezarPartida,
		  MaxIntentosSlider: MaxIntentosSlider,
		  MaxIntentosStorage: MaxIntentosStorage,
		  CapturarCajaRapida: CapturarCajaRapida,
		  TransformarAColores: TransformarAColores,
		  ClickCajas: ClickCajas,
		  SetSlider: SetSlider,
		  SetIntentos: SetIntentos
	   }
}());