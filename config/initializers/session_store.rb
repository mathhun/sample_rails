# Be sure to restart your server when you modify this file.

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    File.read(token_file).chomp
  else
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

Rails.application.config.session_store :cookie_store, key: '_sample_rails_session'
