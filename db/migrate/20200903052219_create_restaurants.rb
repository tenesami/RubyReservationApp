class CreateRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.string :restaurant_name
      t.boolean :avaliable_table

      t.timestamps
    end
  end
end
