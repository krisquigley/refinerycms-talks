module Refinery
  module Talks
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Talks

      engine_name :refinery_talks

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "talks"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.talks_admin_talks_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Talks)
      end
    end
  end
end
