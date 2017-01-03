class TasksController < ApplicationController
	before_action :set_task, only:[:destroy, :update, :show, :edit]
	before_action :set_list
 

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
  		case_task('edit') 	
  	end

  	def new 
  		@task=@list.task_simples.build
  		case_task('new')
  	end

  	def create 

  		@task= Task.new(tasks_params)
  		 
    
	    if @task.save 
	       redirect_to @task.list, notice: 'Task was successfully created.' 
	    else 
	      format.html{ render :index}

	    end

  	end


  	
 	def update

 		respond_to do |format|
	      if @task.update!(tasks_params)
	      		format.html {redirect_to list_path(@task.list) , notice: 'Task was successfully updated.' }
	      		format.json {render json: @task, status: :ok}
	      else
	          format.html {case_task}
	          format.json {render json: @task.errors, status: :unprocessable_entity } 
	      end

	    end

 	end 
	
	private 
	  
	  def set_list 
	  	@list=List.find_by_url(params[:list_id])
	  end
	
	  def set_task
	  	@task= Task.find(params[:id])
	  	@task=@task.decorate if params[:type] == 'TaskTemporary'
	  end

	  def tasks_params()

		  case params[:type]

			  when 'TaskLong'
			 	 params.require('task_long').permit(:list_id, :type,:state,:priority,:progress )
			  when 'TaskSimple'
			 	 params.require('task_simple').permit(:list_id, :type,:description,:state,:priority)
			  when 'TaskTemporary'
			  	 params.require('task_temporary').permit(:list_id, :type,:description,
			  	:state,:priority, :date_begin, :date_end,:description,)

			  end
		 	
	  end

	  def case_task(type)

	  	case params['type']
	  		when 'TaskLong'
	  			render "task_longs/#{type}"
	  		when 'TaskTemporary'
	  			render "task_temporaries/#{type}"
	  		when 'TaskSimple'
	  			render "task_simples/#{type}"
  		end

	  end


end



