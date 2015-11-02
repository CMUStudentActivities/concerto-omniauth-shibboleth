$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "concerto_omniauth_shibboleth/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "concerto_omniauth_shibboleth"
  s.version     = ConcertoOmniauthShibboleth::VERSION
  s.authors     = ["Meg Richards"]
  s.email       = ["mouse@cmu.edu"]
  s.homepage    = "https://github.com/CMUStudentActivities/concerto-" +
                  "omniauth-shibboleth"
  s.summary     = "Provides user authentication using Shibboleth."
  s.description = "Adds user authentication through Shibboleth to Concerto. " +
                  "Based on the concerto_cas_auth addon (https://github.com/" +
                  "concerto-addons/concerto_cas_auth)"
  s.license     = "Apache-2.0"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  s.add_dependency "omniauth-shibboleth"
  s.add_dependency "concerto_identity"
end
