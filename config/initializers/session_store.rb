# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cova_session',
  :secret      => '905cf5f1d1a813fb2a4653420c78ba4a02df4e3393e869ae0bf713726268dc7e0a7f9ee8eb362429fa3df3484cd2586b5fe8e607852f121459d5160cea5b8388'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
