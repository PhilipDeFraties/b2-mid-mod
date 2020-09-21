Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :flights, only: [:index]

  delete '/:flight_id/:passenger_id', to: 'flights#remove_passenger'

  resources :airlines, only: [:show]

end
