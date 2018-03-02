require 'rest-client'
require 'json'


def parse_Json
  response = RestClient.get('https://mvf-devtest-s3api.s3-eu-west-1.amazonaws.com/a4a06bb0-3fbe-40bd-9db2-f68354ba742f.json')
  h = JSON.parse(response)
  user = h["accounts"].find.each do {|h1| h1["lastname"]=="Irwin"}
  end
  puts user
end


def sort
  a = [4,7,8,145,42000,1,-6,72]
  a.sort!
  puts a
end

parse_Json
