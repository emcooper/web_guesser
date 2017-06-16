require 'sinatra'
require 'sinatra/reloader'

r_number = rand(1..100)

get '/' do
  erb :index, :locals => {:number => r_number}
end
