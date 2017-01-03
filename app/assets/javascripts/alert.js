//Override the default confirm dialog by rails 
//with noty.js -> http://ned.im/noty/confirmations.html

$.rails.allowAction = function(link){
  if (link.data("confirm") == undefined){
    return true;
  }
  $.rails.showConfirmationDialog(link);
  return false;
}
//User click confirm button
$.rails.confirmed = function(link){
  link.data("confirm", null);
  link.trigger("click.rails");
}
//Display the confirmation dialog
$.rails.showConfirmationDialog = function(link){
  var message = link.data("confirm");
  
  // Reemplazar esto con el codigo de la libreria deseada
  noty({
  text: " <div id='alert-confirm'>"+ message +" </div> ",
  type:'confirm',
  layout: 'center',
  theme : 'relax',
  dismissQueue: false,
  modal: true,
  killer: true,
  animation: {
      open: 'animated  zoomIn', // Animate.css class names
        close: 'animated  zoomOut', // Animate.css class names
        easing: 'swing'// unavailable - no need
    },
  buttons: [
    {addClass: 'waves-effect waves-light btn  red darken-3', text: 'Cancelar', onClick: function($noty) {
        $noty.close();
      }
    },

    {addClass: 'waves-effect waves-light btn ', text: 'Aceptar', onClick: function($noty) {
        // this = button element
        // $noty = $noty element
         $noty.close();
        $.rails.confirmed(link);
        
     }
   
    }
  ]
});
}