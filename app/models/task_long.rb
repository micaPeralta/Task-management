class TaskLong < Task

	validates :date_begin, presence: true
	validates :date_end, presence: true
	#state -> pendiente, en curso, hecha
	#consultar validacion

	def to_s 
		super + ", Fecha inicio: #{self.date_begin}, Fecha de finalizacion: #{self.date_end}"
	end



end
