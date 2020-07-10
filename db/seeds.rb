require_relative '../drink_hash.rb'

Cocktail.destroy_all

drinks.each do |drink|
  Cocktail.create(name: drink[:name], baseSpirit: drink[:baseSpirit], time: drink[:time], weather: drink[:weather], ingredients: drink[:ingredients])
end



# cool_drink = Cocktail.create(name: "Cool Drink", baseSpirit: "rum", time: "morning", weather: "hot", ingredients: "just rum lol")
