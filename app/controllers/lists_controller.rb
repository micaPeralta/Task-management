class ListsController < ApplicationController
  

  before_action :set_list, only:[:destroy, :update, :show, :edit]
  before_action :expire_tasks , only:[:show]


  def index
   
    @list= List.new 
    #@lists= Array.new
    @lists = ListDecorator.new(List.find(last_lists_browser).last(5))
   
  end

  def show
    @task_simples=@list.task_simples
    @task_temporaries= TaskTemporaryDecorator.decorate_collection( @list.task_temporaries)
    @task_longs=@list.task_longs
   
  end

  def create  	
 
    @list= List.new(list_params)
    
    respond_to do |format|
      if @list.save
        last_lists_browser << @list.id
          format.html  {redirect_to @list, notice: 'Person was successfully created.' }

      else 
        @lists = ListDecorator.new(List.find(last_lists_browser).last(5))
        format.html { render :index }
        format.json { render json: @list.errors, status: :unprocessable_entity } 
      end
    end
  
  end




  def destroy
   
  end


  def update 
    respond_to do |format|
      if @list.update(list_params)
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

  def list_params
    params.require(:list).permit(:name)
  end

  def expire_tasks
      @list.update_tasks_expired
  end

  def last_lists_browser
    session[:lasts] ||= []
  end
 
end