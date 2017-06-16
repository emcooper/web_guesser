require 'sinatra'
require 'sinatra/reloader'

random_number = rand(1..100)

get '/' do
  "#{random_number}"
end
