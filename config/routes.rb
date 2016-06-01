Rails.application.routes.draw do
  root 'users#index'

  resources :user_sessions, only: [:new, :create, :destroy]
  resources :users

  get  'sign_up', to: 'users#new',             as: :sign_up
  get  'log_in',  to: 'user_sessions#new',     as: :log_in
  post 'log_out', to: 'user_sessions#destroy', as: :log_out

  resources :password_resets, only: [:create, :edit, :update]
end
