Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing'
  get "garages/index", to: "garages#index"
  get "/how_it_works", to: 'pages#how_it_works'
  resources :users, only: [:edit, :update] do
    resources :bikes, only: [:create, :new]
    member do
      get "dashboard/home", to: "users#home"
      get "dashboard/my_account", to: "users#show"
      get "dashboard/my_garages", to: "users#mygarages"
      get "dashboard/my_bookings", to: "users#mybookings"
      get "dashboard/add_review", to: "users#addareview"
      get "bookings/:id/accept", to: "bookings#accept_request", as: "accept"
      get "bookings/:id/reject", to: "bookings#reject_request", as: "reject"
      get "bookings/:id/cancel_request_by_owner", to: "bookings#cancel_request_by_owner", as: "cancel_request_by_owner"
      get "bookings/:id/cancel_request_by_biker", to: "bookings#cancel_request_by_biker", as: "cancel_request_by_biker"
      delete "bookings/:id/delete_request", to: "bookings#destroy", as: "delete_request"
    end
    resources :garages, except: [:index] do
      member do
        get "card", to: "garages#show_card"
        get "garages-prompt-loggin", to: "garages#show_prompt_loggin"
      end
      resources :reviews, only: [:new, :create]
      resources :bookings, only: [:new, :edit, :create, :update, :show] do
        resources :chats, only: [ :new, :create ]
      end
    end
  end

  resources :orders, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end
  mount ActionCable.server => "/cable"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
