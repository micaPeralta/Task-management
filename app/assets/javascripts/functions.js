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


$(document).ready(function(){
    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('.modal').modal();
});


$('#clipboard').click(function(){  
  var clip = new Clipboard('#clipboard');

});

var show_selects = function(){
     $('select').material_select();
}
 $(document).ready(show_selects);
 $(document).on('turbolinks:load',show_selects );



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
  
