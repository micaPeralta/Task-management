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
		length: { maximum: 255 }


	validates :state,
	 	presence: true,
	 	inclusion: { in: %w(Pendiente Hecha Expirada ),
	 				message:  "El estado debe ser 'Pendiente', 'Hecha' ó 'Expirada' "}
	validates :date_begin, presence: true
	validates :date_end, presence: true
	
	validates_date :date_begin, :before =>   lambda{|m| m.date_end}
                            
   	validates_date :date_end, :after =>   lambda{|m| m.date_begin}
	
	def to_s 
		super + ", Porcentaje de avance: #{self.progress}% "
	
	end

	def self.expired
		#TaskTemporary.where(self.date_begin)
	end


end
