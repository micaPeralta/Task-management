class TaskSimple < Task

	belongs_to :list

	validates :state,
		presence: { message: :presence_msj },
	 	inclusion: { in: %w(Pendiente  Hecha),
	 				message: :inclusion_msj }
	

	aasm :column => 'state' do 
		state :Pendiente, :initial => true
		state :Hecha

		event :finish do 
		transitions :from => :Pendiente, :to=> :Hecha
		end
	end

	

end
