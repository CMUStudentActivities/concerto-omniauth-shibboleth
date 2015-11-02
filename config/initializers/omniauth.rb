# Concerto Configs are created if they don't exist already
#   these are used to initialize and configure omniauth-shibboleth

Rails.application.config.middleware.use OmniAuth::Builder do
 provider :shibboleth, { :debug => true }
end
