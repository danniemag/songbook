Rails.application.routes.draw do

  resources :dashboard, only: :home

  resources :groups do
    collection do
      delete 'destroy_multiple'
    end
  end

  resources :subscribe
  resources :songs

  authenticated :user do
    root to: 'dashboard#home', as: :authenticated_root
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks',
      registrations: 'users/registrations',
      sessions: 'users/sessions'
  }

  mount Ckeditor::Engine => '/ckeditor'
end
