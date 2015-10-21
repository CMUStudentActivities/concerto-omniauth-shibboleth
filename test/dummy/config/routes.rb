Rails.application.routes.draw do

  mount ConcertoOmniauthShibboleth::Engine => "/concerto_omniauth_shibboleth"
end
