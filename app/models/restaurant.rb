class Restaurant < ApplicationRecord
    belongs_to :user
    has_many :reservations
    has_many :users, through: :reservations

    scope :alpha, -> {order(:restaurant_name)} 
    scope :most_reservations, -> { Restaurant.joins(:reservations).group('restaurants.id').order('count(restaurants.id) desc')}
end
