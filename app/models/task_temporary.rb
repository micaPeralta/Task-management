# == Schema Information
#
# Table name: tasks
#
#  id            :integer          not null, primary key
#  description   :string           not null
#  priority      :string           not null
#  state         :string           not null
#  type          :string
#  to_do_list_id :integer
#  progress      :integer
#  date_begin    :date
#  date_end      :date
#

class TaskTemporary < Task
	
	validates :progress, 
		presence: true,
		:inclusion => { :in => 0..100,
						message: "Progreso inválido [0-100]"},
		numericality: { only_integer: true}

	validates :description,
		length: { maximum: 255 }


	def to_s 
		super + ", Porcentaje de avance: #{self.progress}% "
	
	end
end
