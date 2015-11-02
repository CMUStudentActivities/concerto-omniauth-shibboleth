ConcertoOmniauthShibboleth::Engine.routes.draw do

  # Shib-protected path and route for subsequent handling
  get "/auth/shibboleth/callback", :to => "concerto_omniauth_shibboleth/omniauth_callback#authenticate"
end
