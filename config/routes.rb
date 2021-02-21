Rails.application.routes.draw do
  get "household/edit" => "household#edit"
  post "household/update" =>"household#update"
  get 'household/index'
  root 'home#top'
  get 'users/index' =>"users#index"
  get 'users/show'
  get "users/new"=>"users#new"
  get 'tasks/index' => 'tasks#index'
  post "tasks/create" =>"tasks#create"
  post "users/create" =>"users#create"
  get "/tasks/:id/destroy" =>"tasks#destroy"

  get "login" =>"users#login_form"
  post "login"=>"users#login"
  get "logout" =>"users#logout"
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get "about" => "home#about"
end
