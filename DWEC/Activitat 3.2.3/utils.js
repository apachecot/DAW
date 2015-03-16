var utils = (function () {

		function Alert()
		{
			console.log("Codigo Introducido: "+master.GetCodigoIntento());
			console.log("Codigo Secreto: "+master.GetCodigo());
			console.log("Intentos Restantes: "+masterui.GetIntentos());
			console.log("Colocadas correctamente: "+master.GetOk());
			console.log("Colores seleccionados correctos: "+master.GetKO());	
		}
		
		function CargarLocalStorage()
		{
			if(typeof(Storage) !== "undefined") {
				if(localStorage.estadoPartida=="true")
				{
					masterui.MaxIntentosStorage(parseInt(localStorage.intentosMaximos));
					masterui.SetIntentos(parseInt(localStorage.intentos));
					master.CargarcodigoOculto(localStorage.codigo);
					masterui.EmpezarPartida();
					$( "#slider" ).slider({max:(parseInt(localStorage.intentosMaximos))});
					$("#pIntentos").text("Número restante de intentos");	
					$(".col-md-2.column").find("p.numero").html(parseInt(localStorage.intentos)+1);
					$(".col-md-4.column").find("p.numero").html(parseInt(localStorage.intentosMaximos-localStorage.intentos));
					$( "#buttonJugar" ).text("Dame pistas");					
				}	
			} else {
				console.log("No es posible utilizar Local Storage");
			}
			return masterui.EstadoPartida();
		}
		
		function GuardarLocalStorage(estado)
		{
			if(typeof(Storage) !== "undefined") {
				localStorage.intentosMaximos=masterui.GetMaxIntentos();
				localStorage.intentos=masterui.GetIntentos();
				localStorage.codigo=master.GetCodigo();
				localStorage.estadoPartida=estado;
			} else {
				console.log("No es posible utilizar Local Storage");
			}
		}
		
		return {
			Alert: Alert,
			CargarLocalStorage: CargarLocalStorage,
			GuardarLocalStorage: GuardarLocalStorage
		}


}());