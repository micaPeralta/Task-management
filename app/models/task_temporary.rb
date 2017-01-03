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
   
	#before_validates :set_dates

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
	
	def set_dates
    	self.date_begin= DateTime.strptime(self.date_begin, "%m/%d/%Y").strftime("%Y/%m/%d")
    	self.date_end= DateTime.strptime(self.date_end, "%m/%d/%Y").strftime("%Y/%m/%d")
    end

	def to_s 
		super +", Fecha inicio: #{self.date_begin}, Fecha de finalizacion: #{self.date_end}"
	
	end

	def self.expired
		where('date_end <= ? ', Date::current)
	end

	def self.change_state
		update_all( state:'Expirada')
	end

end
