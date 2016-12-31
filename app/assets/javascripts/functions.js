set_datepicker = function(){
$('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 3, // Creates a dropdown of 15 years to control year
     container: 'body',
     monthsFull: ['Enero','Febrero','Marzo','Abril','Mayo',
     'Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
     monthsShort:['ENE','FEB','MAR','ABR','MAY','JUN','JUL','AGO','SEP','OCT','NOV','DIC'],
     weekdaysLetter: [ 'L', 'M', 'M', 'J', 'V', 'S', 'D' ],
     weekdaysFull:['Domingo','Lunes','Martes','Miercoles','Jueves','Viernes','Sabado'],
     //Today and clear
    today: 'Hoy',
    clear: 'Limpiar',
    close: 'Cerrar',
    format:'dd/mm/yyyy'
  })

}
$( document ).ready(set_datepicker); 
$(document).on('turbolinks:load',set_datepicker );


// cargar modal
load_modal= function(){
    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
     $('.modal').modal();
}
$(document).ready(load_modal);
$(document).on ("ready page:load page:restore",load_modal);

//--------------------------------

//clipboard 
$(document).ready(function(){  

  var clipboard = new Clipboard('#clipboard-btn');
  console.log(clipboard);

  clipboard.on('success', function(e) {
      console.info('Action:', e.action);
      console.info('Text:', e.text);
      console.info('Trigger:', e.trigger);
       Materialize.toast('Copiado!', 4000);
      e.clearSelection();
  });

  clipboard.on('error', function(e) {
      console.error('Action:', e.action);
      console.error('Trigger:', e.trigger);
  });
});

//------------------------------
//Cargar selects 
var show_selects = function(){
     $('select').material_select();
}
 $(document).ready(show_selects);
 $(document).on('turbolinks:load',show_selects );

 //-------------------------------

var load_best_in_place=function(){
  $(".best_in_place").best_in_place();
} 
$(document).on("ready page:change", load_best_in_place);
  

// ajustar selects al contenido

var resize_textarea = function(){
   $('textarea').autosize();
}

$(document).ready(resize_textarea);
$(document).on("ready page:change", resize_textarea);
 $(document).on('turbolinks:load', resize_textarea );


//---------------------------------

// focus del textarea
var focus_textarea= function() {
    var data = $('textarea').val();
    $('textarea').focus().val('').val(data);
}

$(document).ready(focus_textarea); 
 $(document).on("ready page:change",focus_textarea);
 $(document).on('turbolinks:load',focus_textarea );

// focus del input
var focus_input= function() {
    var data = $('#input-text').val();
    $('#input-text').focus().val('').val(data);
}

$(document).ready(focus_textarea); 
 $(document).on("ready page:change",focus_input);
 $(document).on('turbolinks:load',focus_input );


  function showTask(id){
  	   var task = id
     $.ajax({
        url: "/tasks/" + task,
        dataType: "JSON",
        timeout: 10000,
        beforeSend: function(){
           $("#respuesta").html("Cargando...");
        },
        error: function(){
           $("#respuesta").html("Error al intentar buscar el empleado. Por favor intente más tarde.");
        },
        success: function(res){
           if(res){
           	 $('#modal2').modal('open');
             $("#respuesta").html(res.priority);
             $('#description').val(res.description);
             $('#myselect')
             $('#myselect').append('<option value=1 selected="true">'+ res.priority +'</option>');
			
           }else{
              $("#respuesta").html("El legajo no le pertenece a ningún empleado.");
           }
        }
     })
  

  }
  
