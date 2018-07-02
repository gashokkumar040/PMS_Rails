require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdminApprovedProjects
end

module RailsAdmin
  module Config
    module Actions
      class ApprovedProjects < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        # register_instance_option :visible? do
        #   authorized? #&& bindings[:object].class.name.downcase == 'user'          
        # end

        register_instance_option :member do
          true
        end

        register_instance_option :link_icon do
          'icon-check'
        end

        register_instance_option :pjax? do
          true
        end

        register_instance_option :controller do
          proc do
              puts "@@@@======"
              # Project.where("approved = ? AND user_id = ?", true, 11)
              # Project.where("approved = ? AND user_id = ?", true, params[:id])
              puts "@@@@======"
              Project.where("approved = ? AND user_id = ?",true, params[:id])
              flash[:notice] = "You're approved projects are..."
              redirect_to approved_projects_path
              # redirect_to back_or_index
          end
        end

      end
    end
  end
end