# Concerto Configs are created if they don't exist already
#   these are used to initialize and configure omniauth-shibboleth
if ActiveRecord::Base.connection.table_exists? 'concerto_configs'

  # UID
  ConcertoConfig.make_concerto_config("shib_uid_field", "eppn",
                                      :value_type => "string",
                                      :category => "Shibboleth User " +
                                                   "Authentication",
                                      :seq_no => 1,
                                      :description => "Environment variable " +
                                                      "containing a globally " +
                                                      "unique username")
  # First Name
  ConcertoConfig.make_concerto_config("shib_first_name_field", "givenName",
                                      :value_type => "string",
                                      :category => "Shibboleth User " +
                                                   "Authentication",
                                      :seq_no => 2,
                                      :description => "Environment variable " +
                                                      "containing the user's " +
                                                      "first name")
  # Last Name
  ConcertoConfig.make_concerto_config("shib_last_name_field", "sn",
                                      :value_type => "string",
                                      :category => "Shibboleth User " +
                                                   "Authentication",
                                      :seq_no => 3,
                                      :description => "Environment variable " +
                                                      "containing the user's " +
                                                      "last name")
  # Contact email
  ConcertoConfig.make_concerto_config("shib_mail_field", "mail",
                                      :value_type => "string",
                                      :category => "Shibboleth User " +
                                                  "Authentication",
                                      :seq_no => 4,
                                      :description => "Environment variable " +
                                                      "containing the user's " +
                                                      "email address")
end


# Omniauth configuration and attribute mappings hash
omniauth_config = {
  :debug => false,
  :uid_field => ConcertoConfig[:shib_uid_field],
  :name_field => lambda {|request_param|
    "#{request_param.call( ConcertoConfig[:shib_first_name_field] )} " +
      "#{request_param.call( ConcertoConfig[:shib_last_name_field] )}"
  },
  :info_fields => {
    :mail => ConcertoConfig[:shib_mail_field],
    :first_name => ConcertoConfig[:shib_first_name_field],
    :last_name => ConcertoConfig[:shib_last_name_field]
  }
}


# Configure omniauth-shibboleth
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :shibboleth, omniauth_config
end
