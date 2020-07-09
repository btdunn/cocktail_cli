class Cli

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
    Cocktail.drink_quiz
  end


end
