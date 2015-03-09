var utils = (function () {

		function Alert()
		{
			console.log("Codigo Introducido: "+master.GetCodigoIntento());
			console.log("Codigo Secreto: "+master.GetCodigo());
			console.log("Intentos Restantes: "+masterui.GetIntentos());
			console.log("Colocadas correctamente: "+master.GetOk());
			console.log("Colores seleccionados correctos: "+master.GetKO());	
		}
		
		return {
			Alert: Alert
		}


}());