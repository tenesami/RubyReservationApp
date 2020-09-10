class RestaurantsController < ApplicationController
    before_action :redirect_if_not_logged_in
    
    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @restaurant = @user.restaurants.build
          else
            @restaurant = Restaurant.new
          end
    end

    def index
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @restaurants = @user.restaurants.most_reservations
        else
            @error = "These user doesn't exitrs" if params[:user_id]
            @restaurants = Restaurant.most_reservations
        end
    end

    def create
        @restaurant = current_user.restaurants.build(rest_params)
        if @restaurant.save
            redirect_to restaurants_path
        else
            render :new
        end
    end

    
    def show
        @restaurant = Restaurant.find_by_id(params[:id])
        redirect_to restaurants_path if !@restaurant
    end

    private
    def rest_params
        params.require(:restaurant).permit(:restaurant_name, :available_table)
    end

end
