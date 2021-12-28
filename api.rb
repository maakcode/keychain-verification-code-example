require 'sinatra'
require 'rotp'

get '/setup' do
  content_type :json
  secret = ROTP::Base32.random
  totp = ROTP::TOTP.new(secret, issuer: "example.com")

  { link: "apple-#{totp.provisioning_uri("email@example.com")}" }.to_json
end
