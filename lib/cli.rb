class Cli

  def main_menu
    puts "Welcome to Untitled Drink Project"
    sleep(2)
    puts "Enter Island Username"
    username = gets.strip

    @user = User.find_by(username: username)

    if @user
        puts "Welcome back #{@user.username}"
    else
      User.create(username: username)
      puts "Welcome to UDP #{username}"
    end
  end






end
