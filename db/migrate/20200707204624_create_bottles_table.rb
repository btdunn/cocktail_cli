class CreateBottlesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :bottles do |t|
      t.string :liquor_type
      t.string :label
    end
  end
end
