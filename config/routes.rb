Rails.application.routes.draw do
    resources :organizations
    devise_for :users,controllers: { confirmations: 'users/confirmations', registrations: 'users/registrations',sessions: 'users/sessions' }
    devise_for :admins,controllers: { confirmations: 'admins/confirmations', registrations: 'admins/registrations',sessions: 'admins/sessions' }


    #devise_for :users, path: 'users'
    #devise_for :admins, path: 'admins'
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
   
    #resources :admins
    resources :projects
    resources :users
    #get 'users/checkga'
      # get 'users/name'
      # get 'users/email'
 
    root to: 'projects#index'
    #root to: 'organizations#index'

    

    # resources :users do
    #   member do
    #     get :confirm_email
    #   end
    # end

    # if Rails.env.development?
    #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
    # end
  
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
