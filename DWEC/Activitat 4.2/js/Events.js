var Events = (function () {
	$(document).ready(function(){
		flickr.public_cargar_imagenes_tag("");
		$("#tag").keyup(function(e){ 
			var code = e.which;
			if(code==13){
				flickr.public_busqueda_tag();
			} 
		});
		$("#usuario").keyup(function(e){ 
			var code = e.which;
			if(code==13){
				flickr.public_busqueda_usuario();
			} 
		});
		$( "#buscar" ).click(function(e){

			var m = $("#usuario").val();
			if(m!="")
			{
				flickr.public_busqueda_usuario();
			}else{
				flickr.public_busqueda_tag();
			}
		});
		
	});
}());