Rails.application.routes.draw do


  resources :pets
  resources :activities
  resources :users

  root 'renderer#home'

  # root to: redirect('/render/users/pets')

  get '/onsale', to: 'pets#onsale_pets'
  get '/pets/user/:userid', to: 'pets#by_user'
  get '/activities/pet/:petid', to: 'activities#by_pet'
  post '/login', to: 'users#login'

  # frontend route
  get '/render/pets', to: 'renderer#allpets'
  get '/render/pets/:id', to: 'renderer#getPetById'
  get '/render/pets/:petid/activities', to: 'renderer#getActivities'

  get '/render/users', to: 'renderer#createUser'
  get '/render/users/pet', to: 'renderer#createPet'
  get '/render/pets/:petid/activity', to: 'renderer#createActivity'

  get '/render/users/pets', to: 'renderer#getPetsByUserId'

  get '/render/market', to: 'renderer#market'


end
