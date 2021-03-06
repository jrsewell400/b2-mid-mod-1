Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #mechanics 
  get '/mechanics', to: 'mechanics#index'
  get '/mechanics/:mechanic_id', to: 'mechanics#show'

  #parks 
  get '/parks/:park_id', to: 'parks#show'

  #mechanic_rides 
  post '/mechanics/:mechanic_id', to: 'mechanic_rides#create'

  #rides 
  get '/rides/:ride_id', to: 'rides#show'
end
