Rails.application.routes.draw do
  

  resources :lists,  except: [:new, :edit]

  resources :tasks, except: [:new]

  resources :task_temporary, controller: 'tasks', type: 'TaskTemporary' 
  resources :task_long, controller: 'tasks', type: 'TaskLong' 
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root 'lists#index'
end
