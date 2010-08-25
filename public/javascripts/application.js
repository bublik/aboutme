$(document).ready( function(){
  $("button, input:submit, #header a").button();
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