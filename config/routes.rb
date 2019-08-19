Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#landing'

  resources :users, only: [] do
    resources :garages, except: [:destroy] do
      resources :bookings, only: [:new, :edit, :create, :update] do
        resources :chat, only: [:new, :create]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
