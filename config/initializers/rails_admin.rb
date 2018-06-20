require Rails.root.join('lib', 'rails_admin_approve_review.rb')

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
    navigation_icon ' icon-user '
  end


  
  # config.navigation_static_links = {
  # 'myLinks' => 'http://www.facebook.com'
  # }

  # config.authorize_with do
  #   redirect_to main_app.root_path unless current_user.admin = true
  # end

  # config.authorize_with do |controller|
  #   unless current_user.try(:admin?)
  #    flash[:error] = "You are not an admin"
  #    redirect_to 'root_path'
  #   end
  # end

  # config.authenticate_with do
  #   warden.authenticate! :scope => :admin
  # end

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
   config.show_gravatar = true



  config.actions do
    # dashboard do
    #   statistics true
    # end
    dashboard do
      authorization_key :customized
    end
    #dashboard                     # mandatory
    index                         # mandatory
    new

    #approve 

    export
    bulk_delete
    show
    edit
    delete
    show_in_app


    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end


  #Models with control show fields
  config.model User do 
     list do
       field :id
       field :credits
       field :credit_history
       field :first_name 
       field :last_name 
       field :username
       field :email
       field :phonenum 
       field :date_of_birth 
       field :is_female 
       
       field :credit_checker 

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
    # include_all_fields
    # nested do
    #   field :count
    #   field :history 
    # end
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
