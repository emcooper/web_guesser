require 'sinatra'
require 'sinatra/reloader'

R_NUMBER = rand(1..100)


get '/' do
  guess = params["guess"]
  feedback = check_guess(guess)
  erb :index, :locals => {:feedback => feedback}
end

def check_guess(guess)
  dif = guess.to_i - R_NUMBER
  return "Way too high!" if dif > 5
  return "Too high!" if dif < 5 && dif > 0
  return "Too low!" if dif > -5 && dif < 0
  return "Way too low!" if dif < -5
  return "Correct! The secret number is #{R_NUMBER}" if dif == 0
  return "" if params["guess"].nil?
end
