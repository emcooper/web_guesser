require 'sinatra'
require 'sinatra/reloader'

R_NUMBER = rand(1..100)


get '/' do
  guess = params["guess"]
  feedback = check_guess(guess)[0]
  color = check_guess(guess)[1]
  erb :index, :locals => {:feedback => feedback,
                          :color => color}
end

def check_guess(guess)
  dif = guess.to_i - R_NUMBER
  return ["Way too high!", "#8B0000"] if dif > 5
  return ["Too high!", "#CD5C5C"] if dif < 5 && dif > 0
  return ["Too low!", "#CD5C5C"] if dif > -5 && dif < 0
  return ["Way too low!", "#8B0000"] if dif < -5
  return ["Correct! The secret number is #{R_NUMBER}", "#98FB98"] if dif == 0
  return [""] if params["guess"].nil?
end
