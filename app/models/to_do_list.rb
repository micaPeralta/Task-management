class ToDoList < ApplicationRecord

	#una lista puede crearse sin ningúna tarea
	has_many :tasks 
	validates :name, presence: true
	validates :url, presence: true
end
