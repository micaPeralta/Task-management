class ListsController < ApplicationController
  

  before_action :set_list, only:[:destroy, :update, :show, :edit]
  before_action :expire_tasks , only:[:show]
  before_action :update_state , only:[:show]

  def index
   
    @list= List.new 
    #@lists= Array.new
    @lists=ListDecorator.new(List.all)
=begin
    if (!cookies[:lasts].blank?)
      cookies[:lasts][0]=""
      lasts=cookies[:lasts].split(',').last(5)
      @lists= List.find(lasts)
    else 
      cookies[:lasts]=""
    end
=end
	
  end

  def show
    @task_simples=@list.task_simples
    @task_temporaries= TaskTemporaryDecorator.decorate_collection( @list.task_temporaries)
    @task_longs=@list.task_longs
   
  end

  def create
  	
    n=lists_params['name']
    @list= List.new(name: n.capitalize)
    
    respond_to do |format|
      if @list.save
        # cookies[:lasts] += ','+@list.id.to_s
          format.html  {redirect_to @list, notice: 'Person was successfully created.' }

      else 
        format.html { render :index }
        format.json { render json: @list.errors, status: :unprocessable_entity } 
      end
    end
  end




  def destroy
   
  end


  def update 
    respond_to do |format|
      if @list.update(lists_params)
        format.html { redirect_to @list, notice: 'Person was successfully updated.' }
        format.json {render json: @list, status: :ok}
        format.js 
      else
       render :edit 
      end
    end
  end


private

  def set_list
    @list= List.find_by_url(params[:id]).decorate
  end

  def lists_params
    params.require(:list).permit(:name)
  end

  def expire_tasks

      @list.update_tasks_expired

  end

  def update_state
   # TaskLong.completed(@list.id)
  end
end