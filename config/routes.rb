Rails.application.routes.draw do

  resources :dashboard, only: :home

  authenticated :user do
    root to: 'dashboard#home', as: :authenticated_root
  end

  root to: 'dashboard#home'

  devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks',
      registrations: 'users/registrations',
      sessions: 'users/sessions'
  }
end
