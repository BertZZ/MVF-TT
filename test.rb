require 'rest-client'
require 'json'


def parse_Json
  response = RestClient.get('https://mvf-devtest-s3api.s3-eu-west-1.amazonaws.com/a4a06bb0-3fbe-40bd-9db2-f68354ba742f.json')
  json = JSON.parse(response)
  return json
end


def method
  balances = []
  output = parse_Json
  users = output["accounts"]
    users.each do |user|
      if user["balance"].is_a? String
        commaless = user["balance"].gsub(/\,/,"")
        balances << commaless.to_i
      else
        balances << user["balance"].to_i
      end
    end
  sorted = balances.sort.reverse
end



def sort_obj
  users_array = []
  output = parse_Json
  users = output["accounts"]
  users.each do |user|
    if user["balance"].is_a? String
      commaless = user["balance"].gsub!(/\,/,"")
        if user["balance"].to_i > 1000 && user["balance"].to_i < 2000
          users_array << user
        end
      end
  end
  puts users_array
  sorted = users_array.sort_by! { |k,balance| [:balance].to_i }
  puts sorted
end

sort_obj
