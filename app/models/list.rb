# == Schema Information
#
# Table name: lists
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
	has_many :task_temporaries
	has_many :task_longs
	

	validates :name, presence: true,uniqueness: true
	#validates :url, presence: true


	#callbacks
 	after_create :update_slug
 	before_update :assign_slug


 	def to_param
      url
 	end

 	#metodos privados.
	private
		 
		def assign_slug
		    self.url = name.parameterize
		end
		 
		def update_slug
		    update_attributes url: assign_slug
		end
end


 
