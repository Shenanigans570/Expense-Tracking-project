class UsersController < ApplicationController
    # before_action :find_user, only:[ :update, :destroy]
    skip_before_action :authorized_user, only: [:create]
    
    def index 
        render json: User.all, status: :ok
    end

    def create
        newUser = User.create!(user_params)
        session[:user_id] = newUser
        render json: newUser, status: :created
    end

    def show
        render json: @user, status: :ok
    end
    
    def update
        render json: @user.update!(user_params), status: :ok
    end

    def destroy 
        @user.destroy
        head :no_content, status: 204
    end

    private 
    def user_params
        params.permit(:first_name, :last_name, :email, :password)
    end

end
