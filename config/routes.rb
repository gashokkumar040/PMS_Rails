Rails.application.routes.draw do
  get 'users/name'
  get 'users/email'
  get 'user/name'
  get 'user/email'
  devise_for :users, controllers: { confirmations: 'confirmations' }
  resources :welcomes

  root 'welcomes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
