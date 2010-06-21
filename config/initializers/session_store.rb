# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ddc_bcms_session',
  :secret      => '9b4e1ccb88e504558a4a468bb749a0b88fc603e78071262145d2cc7dbf09d84bb8d9fe7359744b25bf4edff474ed223b195fad1eec57261526aace06c6679048'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
