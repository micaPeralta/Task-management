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

	before_create :update_state
	before_update :update_state

	validates :progress, 
		presence: { message: :presence_msj },
		:inclusion => { :in => 0..100,
						message: :inclusion_msj },
		numericality: { only_integer: true, message: :numericality_msj}	

       
	validates :state,
	 	inclusion: { in: %w(Pendiente En_curso Hecha),
					message:  :inclusion_msj}
	

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

	#valores por defecto
	after_initialize do |user|
    	self.progress ||= 0 
  	end


   


	def init_valid?  		
		self.progress > 0 and self.progress < 100 and may_init?
	end

	def made_valid?
		self.progress == 100 and may_finish?
	end

	def update_state
		self.init if init_valid? 
		self.finish if made_valid?	 
	end

	def to_s 
		super +  ", Porcentaje de avance: #{self.progress}% "
	end



end
