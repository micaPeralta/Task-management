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

class Task < ApplicationRecord
	belongs_to :list

	enum priority: {Baja:2 ,Media:1 ,Alta:0}


	validates :description, 
		presence: { message: 'Debe ingresar la descripción '}
	
	validates :priority,
		presence: { message: 'Debe ingresar la prioridad'}, 
	 	inclusion: { in: %w(Alta Media Baja ),
				 message: "La prioridad de debe ser 'Alta' , 'Media' o 'Baja'" }
	
	
	self.default_scope {order ('tasks.priority')}

	
	scope :countOnlyActive, ->{ where('state != ?' , 'Expirada').count }

	after_initialize do |user|
    	self.state  ||= 'Pendiente' 
  	end

	def to_s 
		"#Descripcion: #{self.description}, "+
		"Prioridad: #{self.priority}, "+
		"Estado: #{self.state}"
	end

end
