class SessionsController < ApplicationController
    def home
    end

    def destroy
        #will not clear everything in the session if you want 
        #to remove everty thing in the session use session.clear
        session.delete(:user_id)
        redirect_to '/'
    end

    def new
    end

    def create
        #check dose the user exit the in our system
        #find_by through you error  
        @user = User.find_by_id(user_name: params[:user][:user_name])

        #did we find someone & did they put the right password
        if @user && user.authenticate(params[:user][:password])
        end
    end
end