var Tablero = (function () {

	var tablero=new Array();
	var tableroIds=new Array();
	var casillaPulsada;
			
	function GenerarTableroNuevo(filas,columnas)
	{
		tablero.length=0;
		tableroIds.length=0;
		var id=0;
		for(i=0;i<filas;i++)
		{
			var linea=[];
			var lineaId=[];
			for(j=0;j<columnas;j++)
			{
				
				linea.push(Ficha.GenerarFicha());
				id++;
				lineaId.push(id);
			}
			tablero.push(linea);
			tableroIds.push(lineaId);
		}
	}
	
	
	function LimpiarPosibilidades()
	{
		for(i=0;i<tablero.length;i++)
		{
			for(j=0;j<tablero[i].length;j++)
			{
				if(tablero[i][j].tipo==3)
				{
					tablero[i][j].tipo=0;
				}
			}
		}
	}
	
	
	function GetCasilla(num)
	{
		var i=0;
		var j=0;
		var encontrado=false;
		while(encontrado==false)
		{
			j=0;
			while(j<tableroIds[i].length && encontrado==false)
			{
				if(tableroIds[i][j]==num)
				{
					encontrado=true;
				}
				else{
					j++;
				}
			}
			if(encontrado==false)
			{
				i++;
			}
		}
		return tablero[i][j];
	}
	function VaciarCasilla(num)
	{
		var i=0;
		var j=0;
		var encontrado=false;
		while(encontrado==false)
		{
			j=0;
			while(j<tableroIds[i].length && encontrado==false)
			{
				if(tableroIds[i][j]==num)
				{
					encontrado=true;
				}
				else{
					j++;
				}
			}
			if(encontrado==false)
			{
				i++;
			}
		}
		tablero[i][j].tipo=0;
	}

	return {
		  tablero: tablero,
		  tableroIds: tableroIds,
		  GenerarTableroNuevo: GenerarTableroNuevo,
		  GetCasilla: GetCasilla,
		  LimpiarPosibilidades: LimpiarPosibilidades,
		  casillaPulsada: casillaPulsada,
		  VaciarCasilla: VaciarCasilla
		  
	   }
}());