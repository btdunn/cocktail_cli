class Favorite < ActiveRecord::Base
  belongs_to :cocktail
  belongs_to :user

  def self.favorite_it(cocktail_id, user_id)
    new_fav = Favorite.find_by(cocktail_id: cocktail_id, user_id: user_id)
    if new_fav.nil?
      Favorite.create(cocktail_id: cocktail_id, user_id: user_id)
      puts "Saved to your favorites!"
      sleep(1)
      system "clear"
  end



end