class ListsController < ApplicationController
  
  before_action :set_lists, only:[:index,:create]
  before_action :set_list, only:[:destroy, :update, :show, :edit]

  def index
   #@lists= Array.new
    @list= List.new 
=begin  
    if (cookies[:user].blank?)
       cookies[:last] = {
      :value => "0",
      :expires => Time.now + 3600} 
      
    else 
    
      @lists << List.find[cookies[:uno].to_i]
    

    end
=end

  
  	
  end

  def show
    @tasks= @list.tasks  
  end

  def create
  	
    n=lists_params['name']
    @list= List.new(name: n.capitalize,url:'')
   
    if @list.save 
       cookies[:uno] = @list.id.to_s
       cookies[:last]= (cookies[:last].to_i + 1).to_s
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

  def set_lists
    @lists= List.order('created_at').reverse_order
  end

  def set_list
    @list= List.find_by_url(params[:id])
  end

  def lists_params
    params.require(:list).permit(:name)
  end

end