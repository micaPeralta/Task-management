class TasksController < ApplicationController
	before_action :set_task, only:[:show, :edit, :update, :destroy]
	before_action :set_list, only: [:show, :edit, :update, :destroy,:create,:new]
 	

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
  			render_view('edit')
   	end

  	def new 
  			
  		 	case params['type']
	  		when 'TaskLong'
	  			@task=@list.task_longs.build
	  		when 'TaskTemporary'
	  			@task=TaskTemporary.new
	  		when 'TaskSimple'
	  			@task=TaskSimple.new
  			end

  			render_view('new')
  	end

  	def create 
  		@task=@list.tasks.new(tasks_params)
  	   
  	   respond_to do |format|
		    if @task.save
		      format.html {redirect_to @list, notice: 'Task was successfully created.'} 
		    else 
		      format.html { render_view('new') }  
		    end
		end
  	end


  	
 	def update

 		respond_to do |format|
	      if @task.update(tasks_params)
	      		format.html {redirect_to list_path(@task.list) , notice: 'Task was successfully updated.' }
	      		format.json {render json: @task, status: :ok}
	      else
	          format.html {case_task('edit')}
	          format.json {render json: @task.errors, status: :unprocessable_entity } 
	      end

	    end

 	end 


 	def finish_task
   
 	end
	
	private 
	  

	  def set_task
	  	@task= Task.find(params[:id])
	  	@task=@task.decorate if params[:type] == 'TaskTemporary'
	  end

	  def set_list 
	  	@list=List.find_by_url(params[:list_id])
	  end

	  def render_view(operation)
	  	render "#{params['type'].pluralize.underscore}/#{operation}"
	  end 
	  
	  def tasks_params()

		  case params[:type]

			  when 'TaskLong'
			 	 params.require('task_long').permit( :type,:state,:priority,:progress,:description )
			  when 'TaskSimple'
			 	 params.require('task_simple').permit( :type,:description,:state,:priority)
			  when 'TaskTemporary'
			  	 params.require('task_temporary').permit( :type,:description,
			  	:state,:priority, :date_begin, :date_end,:description,)

			  end
		 	
	  end

end



