//= require jquery
//= require jquery_ujs
//= require ckeditor/init
//= require bootstrap

$(document).ready( function(){
  //$("button, input:submit, #header a, .pagination a, .pagination span")

  $(document).ready(function(){
    $('form[data-remote]').bind("ajax:before", function(){
      for (instance in CKEDITOR.instances){
        CKEDITOR.instances[instance].updateElement();
      }
    });
  });
});