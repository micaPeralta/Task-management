# == Schema Information
#
# Table name: tasks
#
#  id            :integer          not null, primary key
#  description   :string           not null
#  priority      :string           not null
#  state         :string           not null
#  type          :string
#  to_do_list_id :integer
#  progress      :integer
#  date_begin    :date
#  date_end      :date
#

class Task < ApplicationRecord
	#una tarea debe estar asociada a una lista para que sea valida
	belongs_to :to_do_list

	PRIORITIES={
		:alta => 1,
		:media => 2,
		:baja => 3,
	}


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

	def <=> (other)
		PRIORITIES[self.priority] <=> PRIORITIES[other.priority]
	end
end
