var flickr = (function () {

		function cargar_imagenes_tag(tag)
		{
			$.getJSON("http://api.flickr.com/services/feeds/photos_public.gne?jsoncallback=?",
			  {
				tags: tag,
				tagmode: "any",
				format: "json"
			  },
			  function(data) {
			  $('#images').empty();
			  console.log(data);
				$.each(data.items, function(i,item){
				$("<a id="+i+">").attr("href",item.link).appendTo("#images");
				$("<img />").attr("src", item.media.m).attr("alt",item.tags).addClass("img-circle").appendTo("#"+i);
				  if ( i == 20 ) return false;
				});
			  });
			  $('#resultados').empty();
			  var resultados='Resultados de la busqueda de Tags: '+tag;
			  $('#resultados').append(resultados);
		}
		
		function cargar_imagenes_usuario(usuario,tag)
		{
			$.getJSON("http://api.flickr.com/services/feeds/photos_public.gne?jsoncallback=?",
			  {
				tags: tag,
				id: usuario,
				tagmode: "any",
				format: "json"
			  },
			  function(data) {
			  $('#images').empty();
			  console.log(data);
				$.each(data.items, function(i,item){
				$("<a id="+i+">").attr("href",item.link).appendTo("#images");
				$("<img />").attr("src", item.media.m).attr("alt",item.tags).addClass("img-circle").appendTo("#"+i);
				  if ( i == 20 ) return false;
				});
			  });
			  $('#resultados').empty();
			  var resultados='Resultados de la busqueda de Tags: '+tag+', y usuario: '+usuario;
			  $('#resultados').append(resultados);
		}
		
		function busqueda_tag()
		{
			var m = $("#tag").val();
			cargar_imagenes_tag(m);
		}
		function busqueda_usuario()
		{
			var m = $("#usuario").val();
			var t = $("#tag").val();
			cargar_imagenes_usuario(m,t);
		}
		
		return {
			  public_cargar_imagenes_tag: cargar_imagenes_tag,
			  public_busqueda_tag: busqueda_tag,
			  public_busqueda_usuario: busqueda_usuario
		  }
}());