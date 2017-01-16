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

class TaskLong < Task


	validates :progress, 
		presence: {message: 'Debes ingresar el progreso'},
		:inclusion => { :in => 0..100,
						message: "Progreso inválido [0-100]"},
		numericality: { only_integer: true, message:'El progreso  debe ser un número entero'}	

       
	validates :state,
	 	presence: { message:' Debes ingresar el estado'},
	 	inclusion: { in: %w(Pendiente En_curso Hecha ),
	 				message:  "El estado debe ser 'Pendiente','En_curso' ó 'Hecha'' "}
	

	aasm :column => 'state' do 
		state :Pendiente, :initial => true
		state :En_curso
		state :Hecha
		

		event :finish do 
		transitions :from => :En_curso, :to => :Hecha
		end

		event :init do 
		transitions :from => :Pendiente, :to => :En_curso 
			
		end

	end
	after_initialize do |user|
    	self.progress ||= 0 
  	end


   


	def pending_valid?  		
		self.progress > 0 and self.progress < 100  and may_finish?
	end

	def made_valid?
		self.progress == 100
	end


	def to_s 
		super +  ", Porcentaje de avance: #{self.progress}% "
	end



end
