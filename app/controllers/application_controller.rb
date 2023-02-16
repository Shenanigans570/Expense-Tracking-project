class ApplicationController < ActionController::API
include ActionController::Cookies
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::RecordInvalid, with: :invalid

before_action :authorized_user

def current_user 
    @user ||= User.find_by(id:session[:user_id]) if session[:user_id]
end

def authorized_user 
    render json: {errors: "YOU AINT SPOSED TA BE HERE"}, status: :unauthorized unless current_user
end

private
def not_found invalid
    render json: {error: "#{invalid.model} AINT HERE, PLAYA!"}, status: :not_found
end

def invalid invalid
    render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
end


end
