Rails.application.routes.draw do
  
  resources :lists do
  	resources :task ,except: [:index]

  	resources :task_temporary, controller: 'tasks', type: 'TaskTemporary' 
 	resources :task_long, controller: 'tasks', type: 'TaskLong' 
 	resources :task_simple, controller: 'tasks', type: 'TaskSimple' 
  

  end

#  resources :lists,  except: [:new, :edit]

 # resources :tasks, except: [:new]

 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root 'lists#index'
end
