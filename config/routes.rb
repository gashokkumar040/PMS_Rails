Rails.application.routes.draw do
  resources :posts
  get 'users/name'
  get 'users/email'
 
  devise_for :users#, controllers: { confirmations: 'confirmations' }
  resources :welcomes

  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
