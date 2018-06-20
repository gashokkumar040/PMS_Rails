Rails.application.routes.draw do
  resources :credit_checkers 
  
  resources :projects do
    resources :attachments #, except: [:index]
    resources :tasks #,  controller: 'projects/tasks' #, model: 'projects/task'
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
    member do
      get :confirm_email
      
    end
    # resources :projects do
    #   resources :attachments #, except: [:index]
    #   resources :tasks
    # end
  end


  #root to: "users#index"

  root to: 'projects#index'

  # get ':controller(/:action(/:id(.:format)))'

  # if Rails.env.development?
  #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
