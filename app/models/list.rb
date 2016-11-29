# == Schema Information
#
# Table name: to_do_lists
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  url        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class List < ApplicationRecord

	#una lista puede crearse sin ningúna tarea
	has_many :tasks 
	validates :name, presence: true,uniqueness: true
	validates :url, presence: true
end
