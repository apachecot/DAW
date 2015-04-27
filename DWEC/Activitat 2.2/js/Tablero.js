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
				var ficha={tipo:Math.floor(Math.random() * 3), contenta:false};
				linea.push(ficha);
				id++;
				lineaId.push(id);
			}
			tablero.push(linea);
			tableroIds.push(lineaId);
		}
	}
	function BuscarPosicionesLibres(tipo)
	{
		for(i=0;i<tablero.length;i++)
		{
			for(j=0;j<tablero[i].length;j++)
			{
				if(tablero[i][j].tipo==0)
				{
					tablero[i][j].tipo=BuscarAlrededores(i,j,tipo);
				}
			}
		}
	}
	function BuscarAlrededores(x,y,tipo)
	{
		tipofinal=0;
		cercanasbola1=0;
		cercanasbola2=0;
		
		if(x-1>=0)
		{
			if(y-1>=0)
			{
				if(tablero[x-1][y-1].tipo!=0)
				{
					if(tablero[x-1][y-1].tipo==1)
					{
						cercanasbola1++;
					}
					if(tablero[x-1][y-1].tipo==2)
					{
						cercanasbola2++;
					}
				}
			}
			if(y+1<tablero[x].length)
			{
				if(tablero[x-1][y+1].tipo!=0)
				{
					if(tablero[x-1][y+1].tipo==1)
					{
						cercanasbola1++;
					}
					if(tablero[x-1][y+1].tipo==2)
					{
						cercanasbola2++;
					}
				}
			}
			if(tablero[x-1][y].tipo!=0)
			{
				if(tablero[x-1][y].tipo==1)
				{
					cercanasbola1++;
				}
				if(tablero[x-1][y].tipo==2)
				{
					cercanasbola2++;
				}
			}
		} 
		if(x+1<tablero.length)
		{
			if(y-1>=0)
			{
				if(tablero[x+1][y-1].tipo!=0)
				{
					if(tablero[x+1][y-1].tipo==1)
					{
						cercanasbola1++;
					}
					if(tablero[x+1][y-1].tipo==2)
					{
						cercanasbola2++;
					}
				}
			}
			if(y+1<tablero[x].length)
			{
				if(tablero[x+1][y+1].tipo!=0)
				{
					if(tablero[x+1][y+1].tipo==1)
					{
						cercanasbola1++;
					}
					if(tablero[x+1][y+1].tipo==2)
					{
						cercanasbola2++;
					}
				}
			}
			if(tablero[x+1][y].tipo!=0)
			{
				if(tablero[x+1][y].tipo==1)
				{
					cercanasbola1++;
				}
				if(tablero[x+1][y].tipo==2)
				{
					cercanasbola2++;
				}
			}
		}
		if(y-1>=0)
		{
			if(tablero[x][y-1].tipo!=0)
			{
				if(tablero[x][y-1].tipo==1)
				{
					cercanasbola1++;
				}
				if(tablero[x][y-1].tipo==2)
				{
					cercanasbola2++;
				}
			}
		}
		if(y+1<tablero[x].length)
		{
			if(tablero[x][y+1].tipo!=0)
			{
				if(tablero[x][y+1].tipo==1)
				{
					cercanasbola1++;
				}
				if(tablero[x][y+1].tipo==2)
				{
					cercanasbola2++;
				}
			}
		}
		if(tablero[x][y].tipo!=0)
		{
			if(tablero[x][y].tipo==1)
			{
				cercanasbola1++;
			}
			if(tablero[x][y].tipo==2)
			{
				cercanasbola2++;
			}
		}
		
		
		if(cercanasbola2>2)
		{
			tipofinal=3;
		}
		return tipofinal;
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

	return {
		  tablero: tablero,
		  tableroIds: tableroIds,
		  GenerarTableroNuevo: GenerarTableroNuevo,
		  GetCasilla: GetCasilla,
		  BuscarPosicionesLibres: BuscarPosicionesLibres
	   }
}());