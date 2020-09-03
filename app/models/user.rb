class User < ApplicationRecord
    has_many :reviews
    has_many :reviewed_reservations, through: :reviews, source: :reservation

    has_many :reservations
end
