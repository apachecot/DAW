var master = (function () {
		var MAX=6;
		var MIN=1;
		var codigo="";
		var contadorOk;
		var contadorKO;
		
   
	   function cuantasOk(codigoIntento) {
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
	   
	   function cuantasKO(codigoIntento) {
			contadorKO=0;
			for(i=1;i<7;i++)
			{
				j=0;
				while(j<codigoIntento.toString().length)
				{
					if(i==codigoIntento[j])
					{
						contadorKO++;
						j=codigoIntento.toString().length;
					}
					j++;
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
			console.log("codigo intento:"+codigoIntento+" codigo real:"+codigo);
			return codigoIntento;
		}

	   	   
	   function generarCodigoOculto() {
			codigo="";
			for(i=MIN;i<MAX;i++)
			{
				codigo=codigo.toString()+(Math.floor(Math.random() * (MAX - MIN + 1)) + MIN).toString();
			}
	   }
	   
	   function GetCodigo()
	   {
			return codigo;
	   }
	   
	   return {
		  generarCodigoOculto: generarCodigoOculto,
		  GetCodigo: GetCodigo,
		  cuantasKO: cuantasKO,
		  cuantasOk: cuantasOk,
		  TransformarACodigo: TransformarACodigo
	   }
}());