class Cli 

  attr_accessor :user

  def initialize user=nil
    @user = user
  end

  def main_menu
    puts "Welcome to Untitled Drink Project"
    sleep(2)
    puts "Enter Island Username"
    username = gets.strip
    system "clear"
    @user = User.find_by(username: username)
    if @user
        puts "Welcome back #{@user.username}"
    else
      @user = User.create(username: username)
      puts "Welcome to UDP #{username}"
    end
    drink_quiz
  end


  def drink_quiz
    prompt = TTY::Prompt.new
    puts "Time to pick a drink!"
    sleep(1.5)
    baseSpirit = prompt.select("pick your poison!", %w[whiskey gin rum])
    system "clear"
    time = prompt.select("What time of day is it?", %w[morning afternoon night])
    system "clear"
    weather = prompt.select("Tell me about the weather?", %w[rainy cloudy cold hot])
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
        user_id = @user.id
        Favorite.favorite_it(cocktail_id, user_id)
      else
        puts "Ok!"
        sleep(1)
      system "clear"
    end
  end

  def get_user_favs
    user_favs = []
    favs = Favorite.where(id: @user.id)
    favs.each do |fav|
      puts fav.cocktail.name
      user_favs << fav.cocktail.name
    end
    user_favs
  end



end
