$(document).ready(function(){
	var intentos=0;
	$("#plantillaResult").hide();
	 $( ".cuadrado" ).click(function() {
	   circulo=$(this)[0].attributes["bolapadre"].value;
	   $("#"+circulo).removeClass().addClass("circulo").addClass($(this).attr("id"));
	});
	$( "#buttonJugar" ).click(function() {
		intentos=intentos+1;
		//Contador de intentos central
		$(".col-md-2.column").find("p.numero").html(intentos+1);
		//Restador de intentos slider
		$(".col-md-4.column").find("p.numero").html(10-intentos);

		$( "#plantillaResult" ).clone().attr('id', 'result'+(intentos) ).appendTo( "#resultados" );
		for(i=1;i<6;i++)
		{
			$("#result"+(intentos)).find("#circuloResultado"+(i)).removeClass().addClass($('#circulo'+(i)).attr("class"));
			$("#result"+(intentos)).find("#circuloComprobante"+(i)).removeClass().addClass("circulo ok");
		}
		$("#result"+(intentos)).find("p.numero").html(intentos);
		$("#resultados").children().show();
	});
});