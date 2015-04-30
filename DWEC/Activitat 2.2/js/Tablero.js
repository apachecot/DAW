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
				var ficha={tipo:Math.floor(Math.random() * 3), contenta:"infeliz"};
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
					var alrededores=BuscarAlrededores(i,j,tipo);
					if(alrededores[0]>=Config.bola1amigasbola1
					&& alrededores[1]>=Config.bola1amigasbola2 
					&& tipo==1)
					{
						tablero[i][j].tipo=3;
					}
					if(alrededores[0]>=Config.bola2amigasbola1 
					&& alrededores[1]>=Config.bola2amigasbola2
					&& tipo==2)
					{
						tablero[i][j].tipo=3;
					}
				}
			}
		}
	}
	function ComprobarEstados()
	{
		for(i=0;i<tablero.length;i++)
		{
			for(j=0;j<tablero[i].length;j++)
			{
				if(tablero[i][j].tipo!=3 && tablero[i][j].tipo!=0)
				{
					var alrededores=BuscarAlrededores(i,j,tablero[i][j].tipo);
					if(tablero[i][j].tipo==1)
					{
						if(alrededores[0]>=Config.bola1amigasbola1
						&& alrededores[1]>=Config.bola1amigasbola2)
						{
							tablero[i][j].contenta="feliz";
						}
						else{
							tablero[i][j].contenta="infeliz";
						}
					}
					else{
						if(alrededores[0]>=Config.bola2amigasbola1
						&& alrededores[1]>=Config.bola2amigasbola2
						&& tablero[i][j].tipo==2)
						{
							tablero[i][j].contenta="feliz";
						}
						else{
							tablero[i][j].contenta="infeliz";
						}
					}
				}
			}
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
		
		var alrededores=new Array();
		alrededores.push(cercanasbola1);
		alrededores.push(cercanasbola2);
		
		return alrededores;
	}
	function CambiarPosicion(nuevaPosicion)
	{
		var ficha=GetCasilla(this.casillaPulsada);
		
		var i=0;
		var j=0;
		var encontrado=false;
		while(encontrado==false)
		{
			j=0;
			while(j<tableroIds[i].length && encontrado==false)
			{
				if(tableroIds[i][j]==nuevaPosicion)
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
		tablero[i][j].tipo=ficha.tipo;
		VaciarCasilla(this.casillaPulsada);
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
		  BuscarPosicionesLibres: BuscarPosicionesLibres,
		  LimpiarPosibilidades: LimpiarPosibilidades,
		  ComprobarEstados: ComprobarEstados,
		  CambiarPosicion: CambiarPosicion,
		  casillaPulsada: casillaPulsada
		  
	   }
}());