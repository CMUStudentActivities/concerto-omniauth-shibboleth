require_dependency "concerto_omniauth_shibboleth/application_controller"

module ConcertoOmniauthShibboleth
  class OmniauthCallbackController < ApplicationController

    def authenticate
      user = User.from_omniauth( request.env["omniauth.auth"] )
      flash.notice = t('.signed_in')
      sign_in user
      redirect_to request.env['omniauth.origin'] || main_app.root_url
    end # authenticate

  end
end
