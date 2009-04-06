# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_dozorchat_session',
  :secret      => '51b7ea668b8859a73af85c61f8daaa5ab5cd5382976bdefe8d6312cfee505fed8958c1f18eef6ef5e4f7e6dbf56ef132e73ad4fe49e91f6a88e654ccb37ae92b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
