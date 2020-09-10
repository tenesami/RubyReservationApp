class Reservation < ApplicationRecord
    belongs_to :restaurant
    belongs_to :user
    
    validates :num_tables, presence: true
    #accepts_nested_attributes_for :Restaurant

    # def restaurant_attributes=(attributes)
    #     Restaurant = Restaurant.find_or_create_by(
    #         attributes) if !restaurant.empty?
    # end
    
end
