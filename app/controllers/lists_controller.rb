class ListsController < ApplicationController
  
  include CookieHelper 

  before_action :set_list, only:[:destroy, :update, :show, :edit]
  #cambiar el etado a la tarea expirada y no mostrarla
  before_action :expire_tasks , only:[:show]


  def index
   
    @list= List.new 
    #@lists=List.all
    @lists = List.where(id: lists_browser)

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
         update_cookie
         format.html  {redirect_to @list, notice: 'List was successfully created.' }

      else 
        @lists = List.where(id: lists_browser)
        format.html { render :index }
        format.json { render json: @list.errors, status: :unprocessable_entity } 
      end
    end
  
  end




  def destroy
    id=@list.id
    respond_to do |format|
      if  @list.destroy
          cookie_delete_data(id)
          format.js {}
      else

      end
    end
  
   
  end


  def update 
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json {render json: @list, status: :ok}
        format.js 
      else
        format.js { render 'error-update' }
      end
    end
  end



private


  def set_list

       @list= List.find_by_url(params[:id]) or raise  ActiveRecord::RecordNotFound      
       @list=@list.decorate
    
  end

  def list_params
    params.require(:list).permit(:name)
  end

  def expire_tasks
      @list.update_tasks_expired
  end

  def update_cookie
     id=cookie_add_data(@list.id)
     List.delete(id)
  end

  def stored_maximum
    #metodo usado en CookiesHelper
    #define la cantidad de listas que deberan guardarse
    7
  end


end