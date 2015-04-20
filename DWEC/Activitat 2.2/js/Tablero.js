var Tablero = (function () {

	var tablero=new Array();
	var tableroIds=new Array();
			
	function GenerarTableroNuevo(filas,columnas)
	{
		var id=0;
		for(i=0;i<filas;i++)
		{
			var linea=[];
			var lineaId=[];
			for(j=0;j<columnas;j++)
			{
				linea.push(Math.floor(Math.random() * 3));
				id++;
				lineaId.push(id);
			}
			tablero.push(linea);
			tableroIds.push(lineaId);
		}
	}

	return {
		  tablero: tablero,
		  tableroIds: tableroIds,
		  GenerarTableroNuevo: GenerarTableroNuevo
	   }
}());