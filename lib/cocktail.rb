class Cocktail < ActiveRecord::Base
  belongs_to :bottle
  has_many :users

  def self.drink_quiz
    prompt = TTY::Prompt.new
    puts "Time to pick a drink!"
    sleep(1.5)
    baseSpirit = prompt.select("pick your poison!", %w[whiskey gin rum])
    system "clear"
    time = prompt.select("What time of day is it?", %w[day afternoon night])
    system "clear"
    weather = prompt.select("Tell me about the weather?", %w[rainy cloudy cold hot sunny])
    system "clear"
    cocktail_pick = Cocktail.find_by(baseSpirit: baseSpirit.downcase, time: time.downcase, weather: weather.downcase)
    puts "You might like a #{cocktail_pick.name}!" 
    sleep(1)
    puts "You need #{cocktail_pick.baseSpirit} and #{cocktail_pick.ingredients}"
    sleep(2)
    puts "What do you think? Add to favorites?(yes/no)"
    fav_response = gets.strip
    if fav_response.downcase == "yes"
      cocktail_id = Cocktail.get_cocktail_id(cocktail_pick.name)
      user_id = User.get_user_id(username)
      Favorite.favorite_it(cocktail_id, user_id)
    else fav_response.downcase == "no"
      puts "Ok!"
      sleep(1)
      system "clear"
    end

  end

  def self.details(cocktail)
    cocktail_pick = Cocktail.find_by(name: cocktail)
    puts "Name: " + cocktail_pick.name
    puts "Perfect for: " + cocktail_pick.weather + " " + cocktail_pick.time + "s."
    puts "You need: " + cocktail_pick.baseSpirit + " and " + cocktail_pick.ingredients
  end

  def self.get_cocktail_id(cocktail)
    Cocktail.find_by(name: cocktail).id
  end

end