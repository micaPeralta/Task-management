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

	has_many :tasks
	has_many :task_simples 
	has_many :task_temporaries
	has_many :task_longs
	

	validates :name, 
		presence: true,
		uniqueness: true,
		format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }



	#callbacks
 	
 	before_create :assign_slug

 	def last_update

 		maxTask=self.tasks.select('updated_at').maximum(:updated_at)
	    unless maxTask.nil?
	        return [maxTask,self.updated_at].max 
	    else
	      return self.updated_at
	    end
 	end

 	def to_param
      url
 	end

 	#metodos privados.
	private
		 
		def assign_slug
		    self.url = name.parameterize
		end
		 

		
end


 
