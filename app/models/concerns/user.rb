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
      
      first_name = auth.info.first_name.blank? ? 'Andrew' : auth.info.first_name
      last_name = auth.info.last_name.blank? ? 'Carnegie' : auth.info.last_name
      mail = auth.info.mail.blank? ? auth.uid : auth.info.mail

      identity.user.assign_attributes( first_name: first_name,
                                       last_name: last_name,
                                       email: mail )

      if identity.user.persisted?
        identity.user.save
      else
        identity.save!
      end

      return identity.user
    end # from_omniauth

  end # evaluation local to user

end
