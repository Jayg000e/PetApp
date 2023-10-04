Rails.application.routes.draw do
  # get 'pets/index'
  # get 'pets/show'
  # get 'pets/new'
  # get 'pets/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get '/pets', to: 'pets#index'
  resources :pets

end
