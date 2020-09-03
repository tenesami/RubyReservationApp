class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.string :restaurant_name
      t.integer :number_of_tables
      t.datetime :checkin_date
      t.datetime :checkin_time
      t.datetime :checkout_time
      t.string :description
      t.belongs_to :restaurant, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
