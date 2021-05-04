Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { registrations: 'registrations' }
  namespace :api do
    namespace :v1 do
      post :auth, to: 'authentication#create'
      get  '/auth' => 'authentication#fetch'
      resources :properties, only: %i[index create edit destroy] do
        resources :bookings, only: %i[index create edit destroy] do
          resources :reviews, only: %i[index create edit destroy]
        end
      end
    end
  end
end
