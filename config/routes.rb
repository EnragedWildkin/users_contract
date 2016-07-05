Rails.application.routes.draw do
  root 'routes#root'

  resources :user_sessions, only: [:new, :create, :destroy]
  resources :users do
    resources :contracts, only: [:new] do
      get 'generate', on: :collection
    end
  end

  get  'sign_up', to: 'users#new',             as: :sign_up
  get  'log_in',  to: 'user_sessions#new',     as: :log_in
  post 'log_out', to: 'user_sessions#destroy', as: :log_out
  get '/auth/:provider/callback', to: 'user_sessions#create'

  get '/auth/google_oauth2', as: :sign_up_with_google

  resources :password_resets, except: [:index, :destroy]
end
