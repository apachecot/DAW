var masterui = (function () {

		var intentos;
		
   
	   function MostrarPistasEnLista() {
			$( "#plantillaResult" ).clone().attr('id', 'result'+(intentos) ).appendTo( "#resultados" );
			var codigo=master.GetCodigo().split('');
			var aciertos=master.cuantasOk($("#inputText").val());
			var ko=master.cuantasKO($("#inputText").val());
			
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
			$("#resultados").children().show();
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
			$(".col-md-2.column").find("p.numero").html(intentos+1);
			//Restador de intentos slider
			$(".col-md-4.column").find("p.numero").html(10-intentos);
			$( "#slider" ).slider({value:(10-intentos)});	
	   }
	   function SetIntentos()
	   {
			intentos=0;
	   }
	   return {
		  MostrarPistasEnLista: MostrarPistasEnLista,
		  BorrarListaPistas: BorrarListaPistas,
		  ControlIntentos: ControlIntentos,
		  SetIntentos: SetIntentos
	   }
}());