Rails.application.routes.draw do


  resources :pets
  get '/pets/user/:userid', to: 'pets#by_user'

  # frontend route
  get '/render/pets', to: 'renderer#allpets'
  get '/render/pets/:id', to: 'renderer#getPetById'
end
