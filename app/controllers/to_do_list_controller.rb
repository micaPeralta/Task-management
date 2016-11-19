class ToDoListController < ApplicationController
  def index
  	@to_do_lists= ToDoList.order("created_at").limit(5)
  end


  def create 
  	@to_do_list= ToDoList.new
  end

end
