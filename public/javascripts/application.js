$(document).ready( function(){
  $("button, input:submit, #header a, .pagination a, .pagination span").button();
  $(".pagination em").button().addClass('ui-state-active');
  $("#header").buttonset().css('margin-top', '-4px');
//  $(".alert, .error").button({
//    icons: {
//      primary: 'ui-icon-alert'
//    }
//  });
//  $(".notice").buttonset({
//    icons: {
//      primary: 'ui-icon-notice'
//    }
//  });
});