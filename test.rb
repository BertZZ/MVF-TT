require 'rest-client'
require 'json'


def printResponse
  response = RestClient.get('https://mvf-devtest-s3api.s3-eu-west-1.amazonaws.com/a4a06bb0-3fbe-40bd-9db2-f68354ba742f.json')
  h = JSON.parse(response)
  user = h["accounts"].find {|h1| h1['id']=="21dc2de5-309c-41e9-aba0-0375771eb046"}
  puts "Your balance is: " + user["balance"]
end

printResponse
