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


	
	validates :date_begin, presence: true
	validates :date_end, presence: true

	validates_date :date_begin, :before =>   lambda{|m| m.date_end}
                            
   	validates_date :date_end, :after =>   lambda{|m| m.date_begin}
                               

	


	validates :state,
	 	presence: true,
	 	inclusion: { in: %w(Pendiente En_curso Hecha ),
	 				message:  "El estado debe ser 'Pendiente','En_curso' ó 'Hecha'' "}
	


	def to_s 
		super + ", Fecha inicio: #{self.date_begin}, Fecha de finalizacion: #{self.date_end}"
	end



end
