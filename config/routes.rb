Rails.application.routes.draw do
  
  get 'lists/index'

  get 'lists/new',  to: 'lists#index'

  post 'lists/create' 
  
  get 'lists/show/:id' , to: 'lists#show', as: 'list'

  delete 'lists/:id', to: 'lists#destroy'

  patch 'lists/:id',  to: 'lists#update'



 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'lists#index'
end
