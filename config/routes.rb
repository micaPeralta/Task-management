Rails.application.routes.draw do
  

  resources :lists,  except: [:new, :edit]

  resources :tasks, except: [:new, :edit]

 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root 'lists#index'
end
