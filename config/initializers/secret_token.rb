# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
GeneralMongodb::Application.config.secret_key_base = '4dcc28f0355ed8c01684c0dbd2f110eaaa04fdb89b352767e3fedb8b675b32b66a056588b4bc19bf8f274a736e7265534c7d52b41d08271041668e3458b54f22'
