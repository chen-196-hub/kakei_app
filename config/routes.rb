Rails.application.routes.draw do
  
  get 'groups/index' => "groups#index"
  get "groups/:id/show" => "groups#show"
  post "groups/create" => "groups#create"
  post "groups/:id/create_user" =>"groups#create_user"
  get "groups/:id/admin" => "groups#admin"
  post "groups/:id/update" => "groups#update"
  get 'groups/:id/destroy' => 'groups#destroy'
  get "groups/:group_id/show/:id/user_destroy" => "groups#user_destroy"
 

  get 'message_board/:id/index' => "message_board#index"
  post 'message_board/:id/create' =>"message_board#create"

  get "household/edit" => "household#edit"
  post "household/update" =>"household#update"
  get 'household/index'
  
  get 'users/index' =>"users#index"
  get 'users/show'
  get "users/new"=>"users#new"
  post "users/create" =>"users#create"

  get 'tasks/index' => 'tasks#index'
  post "tasks/create" =>"tasks#create"
  get "tasks/:id/edit" => "tasks#edit"
  post "tasks/:id/update" => "tasks#update"
  get "tasks/:id/destroy" =>"tasks#destroy"
  get "tasks/:id/done" => "tasks#task_done"
  get "tasks/:id/done_task_destroy" => "tasks#done_task_destroy"
  get "tasks/:id/undone" => "tasks#undone"
  get "tasks/done_index" => "tasks#done_index"
  get "tasks/:id/" => "tasks#task_done"
  
  get "login" =>"users#login_form"
  post "login"=>"users#login"
  get "logout" =>"users#logout"

 
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'home#top'
  get "about" => "home#about"
end
