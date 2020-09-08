class User < ApplicationRecord
    has_many :reviews
    has_many :reservations #user crated 
    has_many :reviewed_reservations, through: :reviews, source: :reservation

    #since active record take of the validation 
    #we don't need to validate twice 
    has_secure_password

    validates :user_name, uniqueness: true, presence: true
        

end
