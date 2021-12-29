require 'sinatra'
require 'rotp'

get '/setup' do
  content_type :json
  secret = ROTP::Base32.random

  # Get ngrok host name in shell by fvclaus
  # https://gist.github.com/rjz/af40158c529d7c407420fc0de490758b#gistcomment-2372805
  host=`$(curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"https:..([^"]*).*/\1/p')`

  totp = ROTP::TOTP.new(secret, issuer: host)

  # Hardcoded ID
  { link: "apple-#{totp.provisioning_uri("email@example.com")}" }.to_json
end

get '/.well-known/apple-app-site-association' do
  content_type :json
  File.read('apple-app-site-association.json')
end
