class ListsController < ApplicationController
  

  before_action :set_list, only:[:destroy, :update, :show, :edit]

  def index
   
    @list= List.new 
    @lists= Array.new

    if (!cookies[:lasts].blank?)
      cookies[:lasts][0]=""
      lasts=cookies[:lasts].split(',').last(5)
      @lists= List.find(lasts)
    else 
      cookies[:lasts]=""
    end

	
  end

  def show
    @tasks=@list.tasks
    maxTask=@list.tasks.select('updated_at').maximum(:updated_at)
    unless maxTask.nil?
       @date=[maxTask,@list.updated_at].max 
    else
      @date=@list.updated_at
    end
   
  end

  def create
  	
    n=lists_params['name']
    @list= List.new(name: n.capitalize,url:'')
    
    if @list.save 
       cookies[:lasts] += ','+@list.id.to_s
       redirect_to @list, notice: 'Person was successfully created.' 
    else 
      render :index 
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
    @list= List.find_by_url(params[:id])
  end

  def lists_params
    params.require(:list).permit(:name)
  end

end