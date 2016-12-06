/** 
 * getBySelect 0.0.1
 * KosiakMD
 * kosiakMD@yandex.ua
 */
(function( $ ){
  $.fn.getBySelect = function(options) {
    try{
      var uri = new URI(location.href);
      //console.log(uri.toString())
    }catch(er){
    	message = ' \r\n  Conect "URI.js" Library by http://medialize.github.io/URI.js/build.html';
			console.log(er + message);
			alert(er + message);
    }
	  
    $(this).on('change',function(e){
    	var el = e.target,
      		value = el.value,
          name = el.name;
          
			uri.search({ [name]: value });
      //console.log(el,value,name, uri.toString());
      
      location.href = uri.toString();
    });
  };
})( jQuery );
