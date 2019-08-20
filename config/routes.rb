Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing'
  get "garages/index", to: "garages#index"

  resources :users, only: [:edit, :update] do
    get "dashboard", to: "users#show"
    member do
      get "dashboard/my_garages", to: "users#mygarages"
      get "dashboard/my_garages_bookings", to: "users#mygaragesbookings"
    end
    resources :garages, except: [:index, :destroy] do
      resources :bookings, only: [:new, :edit, :create, :update] do
        resources :chat, only: [:new, :create]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
