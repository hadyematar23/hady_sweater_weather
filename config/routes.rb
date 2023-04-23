Rails.application.routes.draw do

  namespace :api do 
    namespace :v0 do 
      resources :forecast, only: [:index]
      resources :users, only: [:create]
      resources :sessions, only: [:create]
      post "/road_trip", to: "road_trips#create"
    end
  end
end
