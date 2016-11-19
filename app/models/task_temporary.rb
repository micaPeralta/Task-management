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
