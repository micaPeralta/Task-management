Rails.application.routes.draw do
  
  resources :lists, :path => '' do 


  	resources :task ,except: [:index]

  	resources :task_temporary, controller: 'tasks', type: 'TaskTemporary' ,except: [:show]
 	resources :task_long, controller: 'tasks', type: 'TaskLong' ,except: [:show]
 	resources :task_simple, controller: 'tasks', type: 'TaskSimple' ,except: [:show]
  

  end


  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 	root 'lists#index'
end
