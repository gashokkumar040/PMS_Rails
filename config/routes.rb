Rails.application.routes.draw do
  resources :wallets 
  get 'buy_btc', to:'wallets#buy_btc', as: :buy_btc
  post 'buy_btc', to:'wallets#save_btc', as: :save_btc

  #to sell btc 
  get 'sell_btc', to:'wallets#sell_btc', as: :sell_btc
  post 'sell_btc', to:'wallets#save_sell_btc', as: :save_sell_btc

  namespace :charts do
    get 'new_btc'
    get "by_month_btc"
  end

  resources :currencies
 
  resources :transaction_histories
  resources :credit_checkers 
  
  resources :projects do
    resources :attachments 
    resources :tasks 
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
