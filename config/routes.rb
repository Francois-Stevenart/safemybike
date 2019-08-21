Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing'
  get "garages/index", to: "garages#index"

  resources :users, only: [:edit, :update] do
    resources :bikes, only: [:create, :new]
    member do
      get "dashboard/home", to: "users#home"
      get "dashboard/my_account", to: "users#show"
      get "dashboard/my_garages", to: "users#mygarages"
      get "dashboard/my_bookings", to: "users#mybookings"
      get "bookings/:id/accept", to: "bookings#accept_request", as: "accept"
      get "bookings/:id/reject", to: "bookings#reject_request", as: "reject"
      get "bookings/:id/cancel_request", to: "bookings#cancel_request", as: "cancel_request"
      delete "bookings/:id/dismiss_cancel_request", to: "bookings#destroy", as: "dismiss_cancel_request"
    end
    resources :garages, except: [:index, :destroy] do
      resources :bookings, only: [:new, :edit, :create, :update, :show] do
        resources :chats, only: [ :new, :create ]
      end
    end
  end

  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
