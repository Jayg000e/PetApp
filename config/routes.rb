Rails.application.routes.draw do


  resources :pets
  resources :activities
  resources :users
  get '/pets/user/:userid', to: 'pets#by_user'

  # frontend route
  get '/render/pets', to: 'renderer#allpets'
  get '/render/pets/:id', to: 'renderer#getPetById'
  get '/render/pets/:petid/activities', to: 'renderer#getActivities'

  get '/activities/pet/:petid', to: 'activities#by_pet'
end
