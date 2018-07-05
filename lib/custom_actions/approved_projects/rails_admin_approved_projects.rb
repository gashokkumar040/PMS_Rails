require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdminApprovedProjects
end

module RailsAdmin
  module Config
    module Actions
      class ApprovedProjects < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :visible? do
          authorized? && bindings[:object].class.name.downcase == 'user'          
        end

        register_instance_option :member do
          true
        end

        register_instance_option :link_icon do
          'icon-check'
        end

        register_instance_option :pjax? do
          false
        end

        # register_instance_option :only do
        #   Project
        # end
        # register_instance_option :http_methods do
        #   [:get]
        # end

         # Breadcrumb parent
        # register_instance_option :breadcrumb_parent do
        #   if root?
        #     [:dashboard]
        #   elsif collection?
        #     [:index, bindings[:abstract_model]]
        #   elsif member?
        #     [:show, bindings[:abstract_model], bindings[:object]]
        #   end
        # end


        register_instance_option :controller do
          Proc.new do
              Project.where("approved = ? AND user_id = ?",true, params[:user_id])
          end
        end

      end
    end
  end
end