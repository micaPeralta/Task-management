class TasksController < ApplicationController
	before_action :set_task, only:[:destroy, :update, :show, :edit]

	def destroy
	    @task.destroy
		respond_to do |format|
	      format.js 
	    end
  	end

  	def show 

  		 respond_to do |format|
  		 	format.json { render json: @task}
  		 end
  	end	

	private 
	
	  def set_task
	    @task= Task.find(params[:id])
	  end


end




