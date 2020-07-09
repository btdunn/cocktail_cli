class Cocktail < ActiveRecord::Base
  belongs_to :bottle
  has_many :users
  
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