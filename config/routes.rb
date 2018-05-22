Rails.application.routes.draw do

  resources :projects
  resources :posts
  get 'users/name'
  get 'users/email'
 
  devise_for :users, controllers: { confirmations: 'users/confirmations', registrations: 'users/registrations',sessions: 'users/sessions' }
  
  resources :welcomes
  resources :users

  root 'projects#index'


  #devise_for :users#, controllers: {sessions: 'users/sessions'}
  #devise_for :users, controllers: {registrations: 'users/registrations'} 
  #root 'posts#index'

  # if Rails.env.development?
  #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
