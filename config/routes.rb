Rails.application.routes.draw do
  
  resources :lists, :path => '' do 


  	resources :tasks ,except: [:index]

  	resources :task_temporaries, controller: 'tasks', type: 'TaskTemporary' ,except: [:show]
 	resources :task_longs, controller: 'tasks', type: 'TaskLong' ,except: [:show]
 	resources :task_simples, controller: 'tasks', type: 'TaskSimple' ,except: [:show]
  
  end


  	patch '/finish/task/:id', to: 'tasks#finish'

  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 	root 'lists#index'
end
