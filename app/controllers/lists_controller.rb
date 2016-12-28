class ListsController < ApplicationController
  

  before_action :set_list, only:[:destroy, :update, :show, :edit]

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
    @task_temporaries=@list.task_temporaries
    @task_longs=TaskLongDecorator.decorate_collection( @list.task_longs)
  end

  def create
  	
    n=lists_params['name']
    @list= List.new(name: n.capitalize)
    
    if @list.save 
      # cookies[:lasts] += ','+@list.id.to_s
       redirect_to @list, notice: 'Person was successfully created.' 
    else 
      redirect_to lists_url
    end
  end




  def destroy
   
  end


  def update 
    respond_to do |format|
      if @list.update(lists_params)
        format.html { redirect_to @list, notice: 'Person was successfully updated.' }
      else
        format.html { render :edit }
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

end