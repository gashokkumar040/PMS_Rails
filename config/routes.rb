Rails.application.routes.draw do

  resources :projects do
    resources :attachments
    resources :tasks
  end

  namespace :dashboard do
    resources :users
    resources :projects
    root to: "users#index"
  end

  resources :organizations
  devise_for :users,controllers: { confirmations: 'users/confirmations', registrations: 'users/registrations',sessions: 'users/sessions' }
  devise_for :admins,controllers: { confirmations: 'admins/confirmations', registrations: 'admins/registrations',sessions: 'admins/sessions' }

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
   
  #resources :admins
  
  resources :users do
    resources :projects
  end

  #root to: "users#index"

  root to: 'projects#index'

  # if Rails.env.development?
  #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
