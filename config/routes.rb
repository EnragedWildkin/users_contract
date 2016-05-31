Rails.application.routes.draw do
  resources :password_resets, only: [:create, :edit, :update]

  resources :users
  # You can have the root of your site routed with "root"
  # root 'welcome#index'
end
