# == Schema Information
#
# Table name: tasks
#
#  id            :integer          not null, primary key
#  description   :string           not null
#  priority      :string           not null
#  state         :string           not null
#  type          :string
#  list_id		 :integer
#  progress      :integer
#  date_begin    :date
#  date_end      :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
require 'aasm'
class Task < ApplicationRecord
	belongs_to :list


	include AASM
	
	enum priority: {Baja:2 ,Media:1 ,Alta:0}


	validates :description, 
		presence: { message: :presence_msj }
	
	validates :priority,
		presence: { message: :presence_msj },
	 	inclusion: { in: %w(Alta Media Baja ),
				 message: :inclusion_msj }
	validates :state,
		presence: { message: :presence_msj }
	
	# ordenar por defecto las tareas por prioridad 
	self.default_scope {order ('tasks.priority')}

	# contar solo las tareas que no esten expiradas
	scope :countOnlyActive, ->{ where('state != ?' , 'Expirada').count }


	# valores por defecto
	after_initialize do 
    	self.state  ||= 'Pendiente' 
  	end

	def to_s 
		"#Descripcion: #{self.description}, "+
		"Prioridad: #{self.priority}, "+
		"Estado: #{self.state}"
	end

end
