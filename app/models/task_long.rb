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
	


	def to_s 
		super +  ", Porcentaje de avance: #{self.progress}% "
	end



end
