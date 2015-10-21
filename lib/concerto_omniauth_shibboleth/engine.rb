module ConcertoOmniauthShibboleth
  class Engine < ::Rails::Engine
    isolate_namespace ConcertoOmniauthShibboleth
    engine_name 'concerto_omniauth_shibboleth'

    # Define plugin information for the Concerto application to read.
    # Do not modify @plugin_info outside of this static configuration block.
    def plugin_info(plugin_info_class)
      @plugin_info ||= plugin_info_class.new do
        # We will add configuration options here as needed.
      end # plugin_info intializer
    end # plugin_info

  end
end
