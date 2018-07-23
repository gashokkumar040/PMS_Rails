require Rails.root.join('lib/custom_actions/approved_projects', 'rails_admin_approved_projects.rb')
require Rails.root.join('lib/custom_actions/user_records', 'rails_admin_user_balance.rb')

RailsAdmin.config do |config|
  # sort_reverse=true

  #config.total_columns_width = 1000
  #config.total_columns_width = 9999999
  ### Popular gems integration
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  # ============
  #config.main_app_name = ["PMS App", "Admin"]
  # or something more dynamic
  config.main_app_name = Proc.new { |controller| 
    [ 
      "PMS App", "#{controller.params[:model_name].try(:titleize)} - #{controller.params[:action].try(:titleize)}" 
    ]}
  # ============

  # Static links can be appended to the main navigation with default name 'Links'
  config.navigation_static_links = {
  'Google' => 'http://www.google.com'
  }

  # to change default name of static links 
  config.navigation_static_label = "My Links"

  config.model 'User' do
    navigation_icon 'icon-user '
  end

  config.model 'Organization' do
    navigation_icon 'icon-th-list'
  end 

  config.model 'Project' do
    navigation_icon 'icon-list-alt'
  end 

  config.model 'Task' do
    navigation_icon 'icon-tasks'
  end

  config.model 'Asset' do
    navigation_icon 'icon-file'
  end

  config.model 'Admin' do
    navigation_icon 'icon-user'
  end

  config.model 'CreditChecker' do
    navigation_icon 'icon-briefcase'
  end
  
  
  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
   config.show_gravatar = true



  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new

    approved_projects
    user_balance

    export
    bulk_delete
    show
    edit
    delete
    # show_in_app

    # rails_admin_charts for rails_admin
    # all
    charts

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end


  #Models with control show fields
  config.model User do 
     list do
       field :id
       field :credits
       field :first_name 
       field :last_name
       field :credit_checkers
       field :username
       field :email
       field :phonenum 

       sort_by :id 
       items_per_page 5 
     end 
  end

  config.model Organization do 
     list do
       field :id
       field :name 
       field :users 
       field :projects

       sort_by :id 
       sort_reverse=false
       items_per_page 5 
     end 
  end  

  config.model Project do
    list do
      field :id
      field :approved
      field :project_title
      field :tasks
      field :asset
      field :user

      sort_by :id
      sort_reverse=false
      items_per_page 5
    end
  end

  config.model Admin do
    list do
      field :id
      field :first_name 
      field :last_name 
      field :username
      field :email
      field :phonenum 
      field :date_of_birth 
      field :is_female 
      field :organizations

      sort_by :id
      sort_reverse=false
      items_per_page 5
    end
  end

  config.model Task do
    list do
      field :id
      field :name
      field :due_date
      field :status
      field :project
      sort_by :id
      sort_reverse=false
      items_per_page 5
    end
  end

  config.model CreditChecker do
    field :id
    field :amount
    field :balance
    field :user
    field :project
    field :account_status

  end

  config.model TransactionHistory do
    field :id
    field :btc_per_transaction
    field :transaction_type
    field :currency_type
    field :currency_status

    field :inr_amount
    field :btc_amount
    field :inr_balance
    field :btc_balance


    field :user
    field :wallet

  end
  # ============= Horizontal Scrolling columns ========= 
  # # Use default horizontal scroll settings of 3 frozen columns (checkboxes, links/actions, ID) with a border on the right:
  # config.horizontal_scroll_list = true

  # # Use horizontal scrolling, but without any frozen columns:
  # config.horizontal_scroll_list = {num_frozen_columns: 0}

  # # Freeze more or fewer columns (col 1 = checkboxes, 2 = links/actions):
  # config.horizontal_scroll_list = {num_frozen_columns: 4}
  # config.horizontal_scroll_list = {num_frozen_columns: 1}

  # # Turn off horizontal scrolling for a specific model:
  # config.model 'Team' do
  #   list do
  #     horizontal_scroll_list false # "nil" doesn't work, it must be explicitly false
  #   end
  # end

  # # Use custom settings of horizontal scrolling for a specific model:
  # config.model 'Team' do
  #   list do
  #     checkboxes false
  #     horizontal_scroll_list(num_frozen_columns: 3) # per-model config does not account for checkboxes
  #   end
  # end

  # # Use horizontal scrolling only for a specific model:
  # config.horizontal_scroll_list = nil
  # config.model 'Team' do
  #   list do
  #     horizontal_scroll_list true
  #   end
  # end

  # ==============

end
