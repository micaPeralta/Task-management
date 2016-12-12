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

	before_validation :set_dates



	def set_dates
    	self.date_begin= DateTime.strptime(self.date_begin, "%m/%d/%Y").strftime("%Y/%m/%d")
    	self.date_end= DateTime.strptime(self.date_end, "%m/%d/%Y").strftime("%Y/%m/%d")
    end

	def to_s 
		super + ", Fecha inicio: #{self.date_begin}, Fecha de finalizacion: #{self.date_end}"
	end



end
