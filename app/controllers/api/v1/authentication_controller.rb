class Api::V1::AuthenticationController < ApiController
    skip_before_action :authenticate_user!, only: [:create]

    def create
        user = User.find_by(email: params[:email])

        if user&.valid_password?(params[:password])
            render json: { email:user.email, token: JsonWebToken.encode(sub: user.id) }
        else
            render json: { errors: 'Invalid email or password' }
        end
    end

    def fetch
        render json: current_user
    end
end