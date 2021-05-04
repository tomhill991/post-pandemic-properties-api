class Api::V1::BookingsController < ApiController
    before_action :authenticate_user!, only: [:index, :show, :update, :create, :destroy]

    def index
        # render json: { user: current_user.email, list: [1, 2, 3] }
        render json: { bob: 'hello' }

        
    end
end