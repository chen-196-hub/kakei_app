Rails.application.routes.draw do
  root 'home#top'
  get 'users/index' =>"users#index"
  get 'users/show'
  get 'tasks/index' => 'tasks#index'
  post "tasks/create" =>"tasks#create"
  get "/tasks/:id/destroy" =>"tasks#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "about" => "home#about"
end
