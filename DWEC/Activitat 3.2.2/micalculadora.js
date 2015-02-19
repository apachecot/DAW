var micalculadora = (function () {
   var operador1 = 5;
   var operador2 = 7;
  
   function sumar() {
	return operador1+operador2;
   }
 
   function restar() {

	 return operador1-operador2;
   }
 
   function operacioRandom() {
		switch(Math.floor((Math.random() * 2) ))
		{
			case 0:
			alert(sumar());
			break;
			case 1:
			alert(restar());
			break;
		}	
   }
 
   return {
	  operacioRandom: operacioRandom
   }
}());