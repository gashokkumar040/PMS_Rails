Rails.application.routes.draw do
  # get 'wallets/show_btc'
  resources :wallets 
  get 'buy_btc', to:'wallets#buy_btc', as: :buy_btc
  post 'buy_btc', to:'wallets#save_btc', as: :save_btc


  # get 'buy_btc', to:'transaction_histories#buy_btc', as: :buy_btc
  # post 'buy_btc', to:'transaction_histories#save_btc', as: :save_btc

  
  resources :currencies#, only: [:show]
 
  # resources :wallets

  get 'balance', to: 'wallets#balance', as: :inr_balance
  resources :transaction_histories
  resources :credit_checkers 
  
  resources :projects do
    resources :attachments #, except: [:index]
    resources :tasks #,  controller: 'projects/tasks' #, model: 'projects/task'
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
  end

  # namespace :charts do
  #   get "new_users"
  #   get "by_month_users"
  # end


  #root to: "users#index"

  root to: 'projects#index'





 

  # get ':controller(/:action(/:id(.:format)))'

  # if Rails.env.development?
  #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
