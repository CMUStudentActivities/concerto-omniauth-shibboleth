namespace :concerto_omniauth_shibboleth do

  desc "Creates external shib identities from existing user emails"
  task :seed_identities => :environment do
    User.all.each do |u|
      identity = ConcertoIdentity::Identity.new(
        user_id: u.id,
        external_id: u.email.downcase,
        provider: "shibboleth"
      )

      if identity.save
        puts "Created Identity: #{identity.external_id} -> #{identity.user_id}"
      else
        puts "Error creating Identity for User #{identity.user_id}"
      end

    end # user loop
  end # seed_identities

end
