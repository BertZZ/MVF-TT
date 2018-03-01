require 'sinatra/base'
require 'rest-client'
require 'json'


class App < Sinatra::Base

  get '/' do
    "Project set up Basics are working"
  end

  get '/accounts' do
    content_type :json
    response = RestClient.get('https://mvf-devtest-s3api.s3-eu-west-1.amazonaws.com/a4a06bb0-3fbe-40bd-9db2-f68354ba742f.json')
    json = JSON.parse(response)
    accounts = json["accounts"]
    accounts.to_json
  end

  get '/accounts/:balance' do
    
  end

end
