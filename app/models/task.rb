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
	
	
	self.default_scope {order ('tasks.priority')}

	
	scope :countOnlyActive, ->{ where('state != ?' , 'Expirada').count }

	after_initialize do 
    	self.state  ||= 'Pendiente' 
  	end

	def to_s 
		"#Descripcion: #{self.description}, "+
		"Prioridad: #{self.priority}, "+
		"Estado: #{self.state}"
	end

end
