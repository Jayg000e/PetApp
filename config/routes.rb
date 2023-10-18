Rails.application.routes.draw do

<<<<<<< HEAD
  resources :pets
  get '/pets/user/:userid', to: 'pets#by_user'

  # frontend route
  get '/render/pets', to: 'renderer#allpets'
  get '/render/pets/:id', to: 'renderer#getPetById'
=======
  # Defines the root path route ("/")
  # root "articles#index"
  # get '/pets', to: 'pets#index'

  resources :pets
  resources :users
  resources :activities
  # get '/example_action', to: 'controller_name#example_action'
  get '/pets/user/:userid', to: 'pets#by_user' 
  get '/activities/pet/:petid', to: 'activities#by_pet'
>>>>>>> main
end
