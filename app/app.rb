require 'sinatra/base'
require 'rest-client'
require 'json'
require 'pry'

class App < Sinatra::Base

  get '/' do
    "I need to put a form here that you put in your user ID and a button puts that user ID into the id field in the test case and a button takes you to /balance"
    erb(:home)
  end

  get '/balance-form' do
    erb(:balance_form)
  end

  get '/details-form' do
    erb(:details_form)
  end

  get '/balance' do
    id = params.fetch("GUID")
    response = RestClient.get('https://mvf-devtest-s3api.s3-eu-west-1.amazonaws.com/a4a06bb0-3fbe-40bd-9db2-f68354ba742f.json')
    json = JSON.parse(response)
    user = json["accounts"].find {|h1| h1['id']== id}
    @balance = user["balance"]
    erb(:balance)
  end

  get '/details' do
    id = params.fetch("GUID")
    response = RestClient.get('https://mvf-devtest-s3api.s3-eu-west-1.amazonaws.com/a4a06bb0-3fbe-40bd-9db2-f68354ba742f.json')
    json = JSON.parse(response)
    user = json["accounts"].find {|h1| h1['id']== id}
    @firstname = user["firstname"]
    @lastname = user["lastname"]
    @email = user["email"]
    @phone = user["telephone"]
    erb(:details)
  end
end
