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
#Task.order(priority: :desc, created_at: :desc).first(5)

class Task < ApplicationRecord
	#una tarea debe estar asociada a una lista para que sea valida
	belongs_to :list

	enum priority: {Baja:2 ,Media:1 ,Alta:0}

	#enum state: [:Pendiente,:Hecha, :En_curso ,:Expirada]


	validates :description, 
		presence: true
	
	validates :priority,
		presence: true,
	 inclusion: { in: %w(Alta Media Baja ),
				 message: "%La prioridad de debe ser 'Alta' , 'Media' o 'Baja'" }
	
	#consultar validacion para las subclases
	validates :state,
	 	presence: true,
	 	inclusion: { in: %w(Pendiente En_curso Hecha Expirada ),
	 				message:  "El estado debe ser 'Pendiente', 'Hecha' ó 'Expirada' "}
	
	self.default_scope {order ('tasks.priority')}


	def to_s 
		"#Descripcion: #{self.description}, "+
		"Prioridad: #{self.priority}, "+
		"Estado: #{self.state}"
	end

end
