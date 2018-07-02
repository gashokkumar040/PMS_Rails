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

        register_instance_option :controller do
          Proc.new do
            # @objects = list_entries(@model_config, :destroy)
            # @projects.each do |project|
            #   project.
            # end
              puts "@@@@======"
              respond_to do |format|
                Project.where("approved = ? AND user_id = ?", true, params[:id])
                format.html{redirect_to approved_projects_path, notice: 'youre approved projects are... '}
              end
              # Project.where("approved = ? AND user_id = ?", true, params[:id])
              puts "@@@@======"
              flash[:notice] = "You're approved projects are..."
              # redirect_to approved_projects_path
              # redirect_to back_or_index
          end
        end

      end
    end
  end
end