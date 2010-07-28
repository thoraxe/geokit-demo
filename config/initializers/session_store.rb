# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_geokit-demo_session',
  :secret      => '053cf94e122b9588c21855471f96ffdada92b6478f822c5a2d3c603cf84c7c43b5aae185783efe5a59e12820fe0dc128729a1f03df84123646fafb9336437fd9'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
