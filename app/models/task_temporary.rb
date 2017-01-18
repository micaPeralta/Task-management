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
   

	validates :description,
		length: { maximum: 255, message: :lenght_msj }


	validates :state,
	 	inclusion: { in: %w(Pendiente Hecha Expirada ),
	 				message:  "El estado debe ser 'Pendiente', 'Hecha' ó 'Expirada' "}
	
	validates :date_begin, presence: { message: :presence_msj}
	validates :date_end, presence: { message: :presence_msj }
	
	validates_date :date_begin, :before =>   lambda{|m| m.date_end},before_message: :before_msj
   	validates_date :date_end, :after =>   lambda{|m| m.date_begin}, after_message: :after_msj
   	validates_date :date_end, :after =>  Date.current, after_message: :after_act_msj

	

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


	#mostrar solo tareas dentro de la fecha 
	self.default_scope { where('date_end > ?', Date.current ) }

	def self.expired
		where('date_end <= ? ', Date::current)
	end

	def self.change_state
		update_all( state:'Expirada')
	end

	def to_s 
		super +", Fecha inicio: #{self.date_begin}, Fecha de finalizacion: #{self.date_end}"
	
	end
end
