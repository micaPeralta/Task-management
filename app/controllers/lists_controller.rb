class ListsController < ApplicationController
  
  before_action :set_lists, only:[:index,:create]
  before_action :set_list, only:[:destroy, :update, :show, :edit]

  def index
   
    @list= List.new
=begin if (cookies[:user].blank?)
       cookies[:user] = {
      :value => "un VALOR",
      :expires => Time.now + 3600} 
      @to_do_lists= ToDoList.order("created_at").limit(3)

    else 
     @to_do_lists= ToDoList.order("created_at").limit(1)

    end
=end
  
  	
  end

  def show
    @tasks= @list.tasks  
  end

  def create
  	
    n=person_params['name']
    @list= List.new(name: n.capitalize,url:'')
    
    if @list.save 
        redirect_to @list, notice: 'Person was successfully created.' 
    else 
      render :index 
    end
  end

end


  def destroy
  end


  def update    
  end


private

  def set_lists
      @lists= List.order('created_at').reverse_order
  end

  def set_list
    @list= List.find_by_url(params[:id])
  end

  def person_params
    params.require(:list).permit(:name)
  end



  

