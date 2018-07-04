require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdminUserBalance 
end

module RailsAdmin
  module Config
    module Actions
      class UserBalance < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :visible? do
          bindings[:object].class.name == 'User'#'CreditChecker'          
        end

        register_instance_option :member do
          true
        end

        register_instance_option :link_icon do
          'icon-envelope'
        end

        register_instance_option :pjax? do
          false
        end

        register_instance_option :controller do
          Proc.new do
             @object.credit_checkers
          end
        end

      end
    end
  end
end