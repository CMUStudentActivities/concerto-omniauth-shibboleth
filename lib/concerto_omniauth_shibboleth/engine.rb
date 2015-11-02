module ConcertoOmniauthShibboleth

  require 'omniauth'
  require 'omniauth-shibboleth'

  class Engine < ::Rails::Engine
    isolate_namespace ConcertoOmniauthShibboleth
    engine_name 'concerto_omniauth_shibboleth'

    # Define plugin information for the Concerto application to read.
    # Do not modify @plugin_info outside of this static configuration block.
    def plugin_info(plugin_info_class)
      @plugin_info ||= plugin_info_class.new do
        # We will add configuration options here as needed.

        # Add this plugin's routes to the main app
        add_route("concerto_omniauth_shibboleth", ConcertoOmniauthShibboleth::Engine)

        # View hook to override Devise sign in links in the main application
        add_view_hook "ApplicationController", :signin_hook,
                      :partial => "concerto_omniauth_shibboleth/links"

      end # plugin_info intializer
    end # plugin_info

  end
end
