class ListsController < ApplicationController
  

  before_action :set_list, only:[:destroy, :update, :show, :edit]
  before_action :tasks_expired , only:[:show]

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
    @task= Task.new
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
        format.html { redirect_to lists_url }
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

  def tasks_expired

    TaskTemporary.expired.update_all(:state => 'Expirada')

  end
end