class Cocktail < ActiveRecord::Base
  

  def self.drink_quiz
    puts "Time to pick a drink!"
    sleep(1)
    puts "Pick your poison!"
    baseSpirit = gets.strip
    puts "What time of day is it?"
    time = gets.strip
    puts "Tell me about the weather!"
    weather = gets.strip
    cocktail_pick = Cocktail.find_by(baseSpirit: baseSpirit.downcase, time: time.downcase, weather: weather.downcase)
    puts cocktail_pick.name
    # binding.pry
  end

end