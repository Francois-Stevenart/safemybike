Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing'
  get "garages/index", to: "garages#index"

  resources :users, only: [:edit, :update] do
    resources :bikes, only: [:create, :new]
    get "dashboard", to: "users#show"
    member do
      get "dashboard/my_garages", to: "users#mygarages"
      get "dashboard/my_bookings", to: "users#mybookings"
    end
    resources :garages, except: [:index, :destroy] do
      resources :bookings, only: [:new, :edit, :create, :update, :show] do
        resources :chats, only: [ :new, :create ]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
