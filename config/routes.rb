Rails.application.routes.draw do
  get 'admin/dashboard'
  devise_for :users
  root 'pages#index'
  get 'pages/index'
  namespace :admin do
    resources :dashboard, only: [:index] # Example route for admin dashboard
  end

  resources :loans, only: [:new, :create]

  patch 'loans/:id/approve', to: 'loans#approve', as: :approve_loan
end
