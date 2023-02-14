class UsersController < ApplicationController

    def create
        render json: User.create!(user_params), status: :created
        
    end

    private 
    def user_params
        params.permit(:first_name, :last_name, :email)
    end

end
