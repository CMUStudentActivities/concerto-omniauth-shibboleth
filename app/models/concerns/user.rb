module Concerns::User
  extend ActiveSupport::Concern

  included do

    # Retrieve or create the authenticated identity.
    # Return or create the/an associated user for the identity.
    def self.from_omniauth auth
      identity = ConcertoIdentity::Identity.where(
        provider: auth.provider,
        external_id: auth.uid ).first_or_create

      identity.user || identity.build_user( password: Devise.friendly_token.first(20) )
      identity.user.assign_attributes( first_name: auth.info.first_name,
                                       last_name: auth.info.last_name,
                                       email: auth.info.mail )
      identity.save!
      return identity.user
    end # from_omniauth

  end # evaluation local to user

end
