# == Schema Information
#
# Table name: tasks
#
#  id            :integer          not null, primary key
#  description   :string           not null
#  priority      :string           not null
#  state         :string           not null
#  type          :string
#  list_id :integer
#  progress      :integer
#  date_begin    :date
#  date_end      :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class TaskTemporary < Task
   
	include AASM

	validates :description,
		length: { maximum: 255 }


	validates :state,
	 	presence: true,
	 	inclusion: { in: %w(Pendiente Hecha Expirada ),
	 				message:  "El estado debe ser 'Pendiente', 'Hecha' ó 'Expirada' "}
	
	validates :date_begin, presence: true
	validates :date_end, presence: true
	
	validates_date :date_begin, :before =>   lambda{|m| m.date_end}
   	validates_date :date_end, :after =>   lambda{|m| m.date_begin}
	

	aasm :column => 'state' do 
		state :Pendiente, :initial => true
		state :Hecha
		state :Expirada

		event :finish do 
		transitions :from => :Pendiente, :to=> :Hecha
		end

		event :expired do 
		transitions :from => :Pendiente, :to=> :Expirada
		end
	end

	


	def to_s 
		super +", Fecha inicio: #{self.date_begin}, Fecha de finalizacion: #{self.date_end}"
	
	end

	#mostrar solo tareas dentro de la fecha 
	self.default_scope { where('date_end > ?', Date.current ) }

	

	def self.expired
		where('date_end <= ? ', Date::current)
	end

	def self.change_state
		update_all( state:'Expirada')
	end

end
