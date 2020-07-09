class Favorite < ActiveRecord::Base
  belongs_to :cocktail
  belongs_to :user

  def self.favorite_it(cocktail_id, user_id)
    new_fav = Favorite.find_by(cocktail_id: cocktail_id, user_id: user_id)
    if new_fav.nil?
      Favorite.create(cocktail_id: cocktail_id, user_id: user_id)
      puts "Saved to your favorites!"
      sleep(2.5)
      system "clear"
    else
      system "clear"
      puts "You already favorited this one! How many have you had?"
      sleep(2.5)
      system "clear"

    end
  end

  def self.get_favorites
    puts @user.favorites.all
  end
end