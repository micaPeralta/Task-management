class TaskSimple < Task
	belongs_to :list

	
	validates :priority,
		presence: true,
	 inclusion: { in: %w(Alta Media Baja ),
				 message: "%La prioridad de debe ser 'Alta' , 'Media' o 'Baja'" }
	
	#consultar validacion para las subclases
	validates :state,
	 	presence: true,
	 	inclusion: { in: %w(Pendiente  Hecha  ),
	 				message:  "El estado debe ser 'Pendiente' ó 'Hecha' "}
	
	
	def to_s 
		"#Descripcion: #{self.description}, "+
		"Prioridad: #{self.priority}, "+
		"Estado: #{self.state}"
	end

end
