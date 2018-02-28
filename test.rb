require 'rest-client'
require 'json'


def printResponse
  response = RestClient.get('https://mvf-devtest-s3api.s3-eu-west-1.amazonaws.com/a4a06bb0-3fbe-40bd-9db2-f68354ba742f.json')
  h = JSON.parse(response)
  accounts = h["accounts"].find {|h1| h1['firstname']=="Erin"}
  puts accounts
end

printResponse
