class Cocktail < ActiveRecord::Base
  belongs_to :bottle
  has_many :users

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
    puts "You might like a #{cocktail_pick.name}!"
    sleep(1)
    puts "You need #{cocktail_pick.baseSpirit} and #{cocktail_pick.ingredients}"
  end

  def self.details(cocktail)
    cocktail_pick = Cocktail.find_by(name: cocktail)
    puts "Name: " + cocktail_pick.name
    puts "Perfect for: " + cocktail_pick.weather + " " + cocktail_pick.time + "s."
    puts "You need: " + cocktail_pick.baseSpirit + " and " + cocktail_pick.ingredients
  end

  def self.get_cocktail_id(cocktail)
    puts Cocktail.find_by(name: cocktail).id
  end

end