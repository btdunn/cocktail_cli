class CreateCocktailsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.string :baseSpirit
      t.string :time
      t.string :weather
      t.string :ingredients
      t.references :bottle
    end
  end
end



