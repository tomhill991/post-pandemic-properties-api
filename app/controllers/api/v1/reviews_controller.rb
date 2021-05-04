class Api::V1::ReviewsController < ApiController
    before_action :authenticate_user!, only: [:update, :create, :destroy]

    def index
        @reviews = Review.find_by(booking_id: params[:booking_id])
        render json: { reviews: @reviews }
    end

end