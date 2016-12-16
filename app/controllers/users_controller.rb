class UsersController < ApplicationController
    before_action :require_login, except: [:index, :create]

    def index
    end

    def create
        @user = User.new( user_params )
        if !@user.valid?
            initialize_flash
            flash[:errors] = @user.errors.full_messages
            redirect_to "/main"
        else
            @user.save
            session[:user_id] = @user.id
            redirect_to "/songs"
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

end
