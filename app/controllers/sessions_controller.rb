class SessionsController < ApplicationController
    
    def home
        @user = User.new
    end

    #logout the user
    def destroy
        #will not clear everything in the session if you want 
        #to remove everything in the session use session.clear
        #session.delete(:user_id)
        session.clear
        redirect_to '/'
    end

    def new
    end

    #log in user to the app 
    def create
        #binding.pry
        #check dose the user exit the in our system
        #find_by through you error  
        @user = User.find_by(user_name: params[:user][:user_name])

        #find someone &  check they put the right password
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user) 
        else
            flash[:notice] = "Incorect login info please try again"
            redirect_to login_path
        end
    end
end