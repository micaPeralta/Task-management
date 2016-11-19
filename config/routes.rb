Rails.application.routes.draw do
  
  get 'to_do_list/index'

 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'to_do_list#index'
end
