Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: [:create, :update] do
    get 'user_dailies/:wordcross_date', to: 'user_dailies#show', as: 'daily_fetch'
    patch 'user_dailies/:id', to: 'user_dailies#update', as: 'daily_update'
    get 'user_micros/:wordcross_date', to: 'user_micros#show', as: 'micro_fetch'
    patch 'user_micros/:id', to: 'user_micros#update', as: 'micro_update'
  end

  get 'dailies/:wordcross_date', to: 'dailies#show', as: 'daily_fetch_author'
  get 'micros/:wordcross_date', to: 'micros#show', as: 'micro_fetch_author'

  resource :session, only: [:create, :destroy]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root to: "static_pages#root"
end
