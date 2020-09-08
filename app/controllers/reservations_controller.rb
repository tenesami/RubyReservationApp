class ReservationsController < ApplicationController
    def new
        @reservation = Reservation.new
        @reservation.build_restaurant #build new restaurant
    end
 
    def create
        @reservation = Reservation.new(reservation_params)
        @reservation.user_id = session[:user_id] #since reservation belong to user 

        if @reservation.save #validaties the reservation
            redirect_to reservation_path(@reservation)
        else
            #@reservation.build_restaurant
            render :new
        end
    end

    def reservation_params
        params.require(:reservation).permit(:number_of_tables, 
        :checkin_date, :checkin_time, :checkout_time, 
        :description, :restaurant_id, restaurant_attributes: [:restaurant_name])
    end
end
