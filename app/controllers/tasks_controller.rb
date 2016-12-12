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

  	def edit

  	end

  	def create 

  		@task= Task.new(tasks_params)
    
	    if @task.save 
	       redirect_to @task, notice: 'Person was successfully created.' 
	    else 
	      render :index 
	    end

  	end

 	def update

	      if @task.update!(tasks_params)
	         redirect_to list_path(@task.list) , notice: 'Person was successfully updated.' 
	      else
	         render :edit 
	      end

 	end 
	
	private 
	  
	 
	
	  def set_task
	    @task= Task.find(params[:id])
	  end

	  def tasks_params()

		  case params[:type]

			  when 'TaskLong'	

			 	 params.require('task_long').permit(:list_id, :type, :date_begin, :date_end,:description,
			  	:state,:priority)
			  when nil
			 	 params.require('task').permit(:list_id, :type,:description,
			  	:state,:priority)
			  when 'TaskTemporary'
			  	 params.require('task_temporary').permit(:list_id, :type,:description,
			  	:state,:priority,:progress)

			  end
		 	
	
		
	  end


end



