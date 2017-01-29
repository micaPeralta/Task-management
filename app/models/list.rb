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
	
	has_many :tasks ,dependent: :destroy
	has_many :task_simples 
	has_many :task_temporaries
	has_many :task_longs
	

	#before_create :normalize_name
	before_create :assign_slug

	validates :name, 
		presence: { message: :presence_msj },
		uniqueness: { :case_sensitive =>false ,message: :uniqueness_msj },
		format: { with: /[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+/,message: :format_msj }

	#validates :url,
	#	uniqueness: { message: :uniqueness_msj}

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

 	def update_tasks_expired
 		self.task_temporaries.expired.change_state
 	end

	private
		
		def normalize_name
      		self.name = name.downcase.titleize
    	end
		
		def assign_slug
		    self.url = name.parameterize
		end
		 

		
end


 
