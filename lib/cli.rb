class Cli 

  attr_accessor :user

  def initialize user=nil
    @user = user
  end

  def login
    puts "Welcome to Thirsty Island"
    sleep(2)
    puts "Enter Island Username"
    username = gets.strip
    system "clear"
    @user = User.find_by(username: username)
    if @user
        puts "Welcome back #{@user.username}"
    else
      @user = User.create(username: username)
      puts "Welcome to Thirsty Island #{username}"
    end
  end

  def main_menu
    prompt = TTY::Prompt.new 
    menu_options = ["drink quiz", "see favorites"]
    menu_selection = prompt.select("menu", menu_options)
    case menu_selection
    when "drink quiz"
      drink_quiz
    
    when "see favorites" 
      get_user_favs
    end
  end


  def drink_quiz
    prompt = TTY::Prompt.new
    puts "Time to pick a drink!"
    sleep(1.5)
    baseSpirit = prompt.select("pick your poison!", %w[whiskey gin rum])
    system "clear"
    time = prompt.select("What time of day is it?", %w[morning afternoon night])
    system "clear"
    weather = prompt.select("Tell me about the weather?", %w[rainy cloudy cold hot ])
    system "clear"
    cocktail_pick = Cocktail.find_by(baseSpirit: baseSpirit.downcase, time: time.downcase, weather: weather.downcase)
    puts "You might like a #{cocktail_pick.name}!" 
    sleep(1)
    puts "You need #{cocktail_pick.baseSpirit} and #{cocktail_pick.ingredients}"
    sleep(2)
    fav_response = prompt.yes?('"What do you think? Add to favorites?')
      if fav_response == "yes"
        cocktail_id = Cocktail.get_cocktail_id(cocktail_pick.name)
        user_id = @user.id
        Favorite.favorite_it(cocktail_id, user_id)
      else
        puts "Ok!"
        sleep(1)
      system "clear"
      main_menu
    end
  end

  def get_user_favs
    user_favs = []
    favs = @user.favorites
    favs.each do |fav|
      puts fav.cocktail.name
      user_favs << fav.cocktail.name
    end
    user_favs
    prompt = TTY::Prompt.new
    options = ["cool!", "lemme delete one"]
    response = prompt.select("These are your favorites!", options)
    case response
    when "cool!"
      main_menu
    when "lemme delete one"
      puts "Which one?"
      this_one = gets.strip
      found_fav = Cocktail.find_by(name: this_one).id
      Favorite.find_by(cocktail_id: found_fav, user_id: @user.id).destroy
    end
  end
end
