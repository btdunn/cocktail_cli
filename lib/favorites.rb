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

  def self.get_user_favs(name)
    user_favs = []
    id = User.get_user_id(name)
    favs = Favorite.where(user_id: id)
    favs.each do |fav|
      puts fav.cocktail.name
      user_favs << fav.cocktail.name
    end
    user_favs
  end

end