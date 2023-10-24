Rails.application.routes.draw do


  resources :pets
  resources :activities
  resources :users
  get '/pets/user/:userid', to: 'pets#by_user'
  get '/activities/pet/:petid', to: 'activities#by_pet'
  post '/login', to: 'users#login'

  # frontend route
  get '/render/pets', to: 'renderer#allpets'
  get '/render/pets/:id', to: 'renderer#getPetById'
  get '/render/pets/:petid/activities', to: 'renderer#getActivities'
  get '/render/users/pet', to: 'renderer#createPet'
  get '/render/pets/:petid/activity', to: 'renderer#createActivity'

  get '/render/users/pets', to: 'renderer#getPetsByUserId'


end
