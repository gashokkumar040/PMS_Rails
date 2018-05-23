Rails.application.routes.draw do

  devise_for :admins
  resources :projects
  resources :posts
  get 'users/name'
  get 'users/email'
 
  devise_for :users, controllers: { confirmations: 'users/confirmations', registrations: 'users/registrations',sessions: 'users/sessions' }
  
  resources :welcomes
  #resources :users

  root 'projects#index'

  resources :users do
    member do
      get :confirm_email
    end
  end


  # if Rails.env.development?
  #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
