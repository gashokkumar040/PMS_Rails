Rails.application.configure do

  # config.debug_exception_response_format = :api
  #config.paperclip_defaults = { storage: :fog, fog_credentials: { provider: "Local", local_root: "#{Rails.root}/public"}, fog_directory: "", fog_host: "localhost"}
  #Paperclip.options[:command_path] = "/usr/local/bin/"
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options)
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  #config.action_mailer.raise_delivery_errors = false
  #config.action_mailer.default_url_options = { :host => "http:/127.0.0.1:3000/" }
  config.action_mailer.perform_caching = false
  config.action_mailer.preview_path
#===========
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
  config.action_mailer.asset_host = 'http://localhost:3000' #Or your domain
  config.action_mailer.asset_host = config.action_controller.asset_host
  #config.action_mailer.delivery_method = :letter_opener_web
  config.action_mailer.delivery_method = :smtp
 
  #ActionMailer::Base.add_delivery_method :my_test_delivery, Mail::MyTestDelivery
  #config.action_mailer.delivery_method = :my_test_delivery
#=====
  #ActionMailer::Base.add_delivery_method :my_test_smtp_delivery, Mail::MyTestSmtpDelivery
  #config.action_mailer.delivery_method = :my_test_smtp_delivery
  
  ActionMailer::Base.smtp_settings = {
    :address        => "smtp.gmail.com",
    :port           => 587,
    :domain         => "gmail.com",
    :authentication => :login,
    :user_name      => 'ashokkumar.sykamcs@gmail.com',
    :password       => '9000243312',
    :enable_starttls_auto => true
  }

    
#=====
  #change to true to allow email to be sent during development
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = true
  #config.action_mailer.default :charset => "utf-8"
#===========

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = true#:page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  # config.file_watcher = ActiveSupport::EventedFileUpdateChecker
  config.file_watcher = ActiveSupport::FileUpdateChecker

  # for not reloading again and again the page remove above EventedFileUpdateChecker to FileUpdateChecker
  config.reload_classes_only_on_change = true


end