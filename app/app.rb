require 'sinatra/base'
require 'rest-client'
require 'json'
require 'pry'

class App < Sinatra::Base

  def get_json
    response = RestClient.get('https://mvf-devtest-s3api.s3-eu-west-1.amazonaws.com/a4a06bb0-3fbe-40bd-9db2-f68354ba742f.json')
    json = JSON.parse(response)
  end

  get '/' do
    erb(:home)
  end

  get '/balance-form' do
    erb(:balance_form)
  end

  get '/details-form' do
    erb(:details_form)
  end

  get '/contact-form' do
    erb(:contact_form)
  end

  get '/balance' do
    id = params.fetch("GUID")
    output = get_json
    user = output["accounts"].find {|h1| h1['id']== id}
    @balance = user["balance"]
    erb(:balance)
  end

  get '/details' do
    id = params.fetch("GUID")
    output = get_json
    user = output["accounts"].find {|h1| h1['id']== id}
    @firstname = user["firstname"]
    @lastname = user["lastname"]
    @email = user["email"]
    @phone = user["telephone"]
    erb(:details)
  end

  get '/debts' do
    @indebt = []
    output = get_json
    users = output["accounts"]
    users.each do |user|
      if user["balance"].to_i < 0
        @indebt << user["id"]
      end
    end
    erb(:debts)
  end

  get '/contact_info' do
    id = params.fetch("GUID")
    output = get_json
    user = output["accounts"].find {|h1| h1['id']== id}
    @firstname = user["firstname"]
    @lastname = user["lastname"]
    @email = user["email"]
    @phone = user["telephone"]
    @balance = user["balance"]
    erb(:contact)
  end
end
