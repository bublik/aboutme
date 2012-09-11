$(document).ready( function(){
  $("button, input:submit, #header a, .pagination a, .pagination span").button();
  $(".pagination em").button().addClass('ui-state-active');
  $("#header").buttonset().css('margin-top', '-4px');

  $(document).ready(function(){
    $('form[data-remote]').bind("ajax:before", function(){
      for (instance in CKEDITOR.instances){
        CKEDITOR.instances[instance].updateElement();
      }
    });
  });
});