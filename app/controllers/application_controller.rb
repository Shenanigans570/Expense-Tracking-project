class ApplicationController < ActionController::API
rescue_from ActiveRecord::RecordNotFound, with: :not_found
rescue_from ActiveRecord::RecordInvalid, with: :invalid

def not_found invalid
    render json: {error: "#{invalid.model} AINT HERE, PLAYA!"}, status: :not_found
end

def invalid invalid
    render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
end


end
