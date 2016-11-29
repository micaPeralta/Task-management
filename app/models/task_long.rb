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

class TaskLong < Task

	validates :date_begin, presence: true
	validates :date_end, presence: true
	#state -> pendiente, en curso, hecha
	#consultar validacion

	def to_s 
		super + ", Fecha inicio: #{self.date_begin}, Fecha de finalizacion: #{self.date_end}"
	end



end
