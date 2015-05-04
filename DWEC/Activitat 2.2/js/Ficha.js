var Ficha = (function () {

	var nInfelices;


	function GenerarFicha()
	{
		var ficha={tipo:Math.floor(Math.random() * 3), contenta:"infeliz"};
		return ficha;
	}
	
	function CambiarPosicion(nuevaPosicion)
	{
		var ficha=Tablero.GetCasilla(Tablero.casillaPulsada);
		
		var i=0;
		var j=0;
		var encontrado=false;
		while(encontrado==false)
		{
			j=0;
			while(j<Tablero.tableroIds[i].length && encontrado==false)
			{
				if(Tablero.tableroIds[i][j]==nuevaPosicion)
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
		Tablero.tablero[i][j].tipo=ficha.tipo;
		Tablero.VaciarCasilla(Tablero.casillaPulsada);
	}
	function BuscarPosicionesLibres(tipo)
	{
		nPosibles=0;
		for(i=0;i<Tablero.tablero.length;i++)
		{
			for(j=0;j<Tablero.tablero[i].length;j++)
			{
				if(Tablero.tablero[i][j].tipo==0)
				{
					var alrededores=BuscarAlrededores(i,j,tipo);
					if(alrededores[0]>=Config.bola1amigasbola1
					&& alrededores[1]>=Config.bola1amigasbola2 
					&& tipo==1)
					{
						Tablero.tablero[i][j].tipo=3;
						nPosibles++;
					}
					if(alrededores[0]>=Config.bola2amigasbola1 
					&& alrededores[1]>=Config.bola2amigasbola2
					&& tipo==2)
					{
						Tablero.tablero[i][j].tipo=3;
						nPosibles++;
					}
				}
			}
		}
		return nPosibles;
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
				if(Tablero.tablero[x-1][y-1].tipo!=0)
				{
					if(Tablero.tablero[x-1][y-1].tipo==1)
					{
						cercanasbola1++;
					}
					if(Tablero.tablero[x-1][y-1].tipo==2)
					{
						cercanasbola2++;
					}
				}
			}
			if(y+1<Tablero.tablero[x].length)
			{
				if(Tablero.tablero[x-1][y+1].tipo!=0)
				{
					if(Tablero.tablero[x-1][y+1].tipo==1)
					{
						cercanasbola1++;
					}
					if(Tablero.tablero[x-1][y+1].tipo==2)
					{
						cercanasbola2++;
					}
				}
			}
			if(Tablero.tablero[x-1][y].tipo!=0)
			{
				if(Tablero.tablero[x-1][y].tipo==1)
				{
					cercanasbola1++;
				}
				if(Tablero.tablero[x-1][y].tipo==2)
				{
					cercanasbola2++;
				}
			}
		} 
		if(x+1<Tablero.tablero.length)
		{
			if(y-1>=0)
			{
				if(Tablero.tablero[x+1][y-1].tipo!=0)
				{
					if(Tablero.tablero[x+1][y-1].tipo==1)
					{
						cercanasbola1++;
					}
					if(Tablero.tablero[x+1][y-1].tipo==2)
					{
						cercanasbola2++;
					}
				}
			}
			if(y+1<Tablero.tablero[x].length)
			{
				if(Tablero.tablero[x+1][y+1].tipo!=0)
				{
					if(Tablero.tablero[x+1][y+1].tipo==1)
					{
						cercanasbola1++;
					}
					if(Tablero.tablero[x+1][y+1].tipo==2)
					{
						cercanasbola2++;
					}
				}
			}
			if(Tablero.tablero[x+1][y].tipo!=0)
			{
				if(Tablero.tablero[x+1][y].tipo==1)
				{
					cercanasbola1++;
				}
				if(Tablero.tablero[x+1][y].tipo==2)
				{
					cercanasbola2++;
				}
			}
		}
		if(y-1>=0)
		{
			if(Tablero.tablero[x][y-1].tipo!=0)
			{
				if(Tablero.tablero[x][y-1].tipo==1)
				{
					cercanasbola1++;
				}
				if(Tablero.tablero[x][y-1].tipo==2)
				{
					cercanasbola2++;
				}
			}
		}
		if(y+1<Tablero.tablero[x].length)
		{
			if(Tablero.tablero[x][y+1].tipo!=0)
			{
				if(Tablero.tablero[x][y+1].tipo==1)
				{
					cercanasbola1++;
				}
				if(Tablero.tablero[x][y+1].tipo==2)
				{
					cercanasbola2++;
				}
			}
		}
		/*
		if(Tablero.tablero[x][y].tipo!=0)
		{
			if(Tablero.tablero[x][y].tipo==1)
			{
				cercanasbola1++;
			}
			if(Tablero.tablero[x][y].tipo==2)
			{
				cercanasbola2++;
			}
		}
		*/
		
		var alrededores=new Array();
		alrededores.push(cercanasbola1);
		alrededores.push(cercanasbola2);
		
		return alrededores;
	}
	function ComprobarEstados()
	{
		this.nInfelices=0;
		for(i=0;i<Tablero.tablero.length;i++)
		{
			for(j=0;j<Tablero.tablero[i].length;j++)
			{
				if(Tablero.tablero[i][j].tipo!=3 && Tablero.tablero[i][j].tipo!=0)
				{
					var alrededores=BuscarAlrededores(i,j,Tablero.tablero[i][j].tipo);
					if(Tablero.tablero[i][j].tipo==1)
					{
						if(alrededores[0]>=Config.bola1amigasbola1
						&& alrededores[1]>=Config.bola1amigasbola2)
						{
							Tablero.tablero[i][j].contenta="feliz";
						}
						else{
							Tablero.tablero[i][j].contenta="infeliz";
							this.nInfelices++;
						}
					}
					else{
						if(alrededores[0]>=Config.bola2amigasbola1
						&& alrededores[1]>=Config.bola2amigasbola2
						&& Tablero.tablero[i][j].tipo==2)
						{
							Tablero.tablero[i][j].contenta="feliz";
						}
						else{
							Tablero.tablero[i][j].contenta="infeliz";
							this.nInfelices++;
						}
					}
				}
			}
		}
	}
	
	return {
		GenerarFicha: GenerarFicha,
		CambiarPosicion: CambiarPosicion,
		BuscarPosicionesLibres: BuscarPosicionesLibres,
		ComprobarEstados: ComprobarEstados,
		nInfelices: nInfelices
	}

}());