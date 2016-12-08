

$(document).ready(function(){
    // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
    $('.modal').modal();
});


$('#clipboard').click(function(){  

  var clip = new Clipboard('#clipboard');


});

 $(document).ready(function() {
    $('select').material_select();
  });



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

             $('#myselect').append('<option value=1 selected="true">'+ res.priority +'</option>');
			
           }else{
              $("#respuesta").html("El legajo no le pertenece a ningún empleado.");
           }
        }
     })
  

  }
  
