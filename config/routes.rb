Rails.application.routes.draw do
  resources :posts
  get 'users/name'
  get 'users/email'
 
  devise_for :users#, controllers: { confirmations: 'confirmations' }
  resources :welcomes

  root 'posts#index'

  # if Rails.env.development?
  #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
