Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing'
  get "garages/index", to: "garages#index"

  resources :users, only: [:edit, :update] do
    resources :bikes, only: [:create, :new]
    member do
      get "dashboard", to: "users#show"
      get "dashboard/my_garages", to: "users#mygarages"
      get "dashboard/my_bookings", to: "users#mybookings"
      get "bookings/:id/accept", to: "bookings#accept_request", as: "accept"
      get "bookings/:id/reject", to: "bookings#reject_request", as: "reject"
    end
    resources :garages, except: [:index, :destroy] do
      resources :bookings, only: [:new, :edit, :create, :update] do
        resources :chat, only: [:new, :create]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
