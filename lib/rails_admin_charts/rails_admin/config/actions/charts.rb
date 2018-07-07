module RailsAdmin
  module Config
    module Actions
      class Charts < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :collection? do
          true
        end

        register_instance_option :visible do
          bindings[:abstract_model].model < RailsAdminCharts
          #bindings[:object].class.name == 'User'
        end

        register_instance_option :http_methods do
          [:get, :post, :delete]
        end


        register_instance_option :pjax? do
          false
        end

        register_instance_option :link_icon do
          'icon-bar-chart fa fa-bar-chart-o'
        end
      end
    end
  end
end