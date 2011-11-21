# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_spknd_session',
  :secret      => '18eb7a3a47deea3cfdb9843f539cf3369188a446b8b0ab18d23f5d80e4548b4917c1ce6e5802cfec9671d20f99e4c496e6081c45bbb357d747ebcffb289da2c2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
