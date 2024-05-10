Rails.application.routes.draw do
  get 'admin/dashboard'
  devise_for :users
  root 'pages#index'
  get 'pages/index'
  get 'admin/dashboard', to: 'admin#dashboard'


  resources :loans, only: [:new, :create]
end
