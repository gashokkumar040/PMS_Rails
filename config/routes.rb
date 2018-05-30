Rails.application.routes.draw do

    namespace :admin do
      resources :admins
      resources :users
      resources :projects

      root to: "projects#index"
    end

    devise_for :admins

    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

    resources :projects
    #resources :users

      get 'users/name'
      get 'users/email'
 
    devise_for :users#,controllers: { confirmations: 'users/confirmations', registrations: 'users/registrations',sessions: 'users/sessions' }

    root to: 'projects#index'

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
