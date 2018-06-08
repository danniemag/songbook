Rails.application.routes.draw do
  get 'dashboard/home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'dashboard#home'
end
