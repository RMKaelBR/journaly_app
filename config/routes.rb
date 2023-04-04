Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
 
  get '/categories' => 'categories#index'
  get '/categories/new' => 'categories#new', as: 'new_category'
  post '/categories' => 'categories#create', as: 'create_category'
  get '/categories/:id' => 'categories#show', as: 'category'
  get '/categories/:id/edit' => 'categories#edit', as: 'edit_category'
  patch '/categories/:id' => 'categories#update'
  delete 'categories/:id' => 'categories#destroy'

  get '/bahay' => 'bahay#index'

  # root "categories#index"

  # get '/categories' => 'categories#index'
  # get '/categories/new' => 'categories#new', as: 'new_category'
  # post '/categories' => 'categories#create', as: 'create_category'
  # get '/categories/:id' => 'categories#show', as: 'category'
  # get '/categories/:id/edit' => 'categories#edit', as: 'edit_category'
  # patch '/categories/:id' => 'categories#update'
  # delete '/categories/:id' => 'categories#destroy', as: 'delete_category'




  # get "/articles", to: "articles#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
