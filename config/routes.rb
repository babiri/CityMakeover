Rails.application.routes.draw do
  devise_for :users
  root to: 'fixpoints#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :fixpoints, except: [:destroy]
end
