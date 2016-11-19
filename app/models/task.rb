class Task < ApplicationRecord
	#una tarea debe estar asociada a una lista para que sea valida
	belongs_to :to_do_list


	validates :description, 
		presence: true
	
	validates :priority,
		presence: true, 
	    inclusion: { in: %w(alta media baja),
	   				 message: "%La prioridad de debe ser 'alta' , 'media' o 'baja'" }
	
#consultar validacion para las subclases
	validates :state,
	 	presence: true,
	 	inclusion: { in: %w(pendiente en_curso hecha expirada),
	 				message:  "%{value} no es un estado válido "}
	def to_s 
		"#Descripcion: #{self.description}, "+
		"Prioridad: #{self.priority}, "+
		"Estado: #{self.state}"
	end
end
