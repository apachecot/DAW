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
				//Comprobamos si anteriormente había una partida empezada
				if(localStorage.estadoPartida=="true")
				{
					//Cargamos los intentos máximos
					masterui.MaxIntentosStorage(parseInt(localStorage.intentosMaximos));
					//Cargamos los intentos y restamos 1 para hacer la última comprobación
					masterui.SetIntentos(parseInt(localStorage.intentos)-1);
					//Cargamos el código oculto de la partida anterior
					master.CargarcodigoOculto(localStorage.codigo);
					//Desactivamos el slider
					$( "#slider" ).slider( "option", "disabled", true );
					
					masterui.EmpezarPartida();
					//Colocamos el último valor introducido
					$("#inputText").val(localStorage.ultimaJugada);
					masterui.TransformarAColores(localStorage.ultimaJugada);
					//Jugamos para hacer la última jugada del jugador y mostrarle los resultados
					master.Jugar();
					$("#pIntentos").text("Número restante de intentos");	
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
				//Guardamos la partida en localStorage
				localStorage.intentosMaximos=masterui.GetMaxIntentos();
				localStorage.intentos=masterui.GetIntentos();
				localStorage.codigo=master.GetCodigo();
				localStorage.estadoPartida=estado;
				localStorage.ultimaJugada=master.GetCodigoIntento();
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