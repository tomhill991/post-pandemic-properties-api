class Api::V1::ReviewsController < ApiController
    before_action :authenticate_user!, only: [:update, :create, :destroy]

    def index
        @reviews = Review.find_by(booking_id: params[:booking_id])
        render json: { reviews: @reviews }
    end

    # def create

    # end

    # private
    # def reviews_params
    #     json = JSON.parse(params[:data])
    #     json = ActionController::Parameters.new(json)
    #     json.permit(
    #         :title, :description, :max_guests, 
    #         :price_per_day, :address, :average_rating, 
    #         :has_beach_nearby, :has_beds, :has_kitchen, 
    #         :has_swimming_pool, :has_hdtv, :has_bathtub
    #     ).merge(
    #         # fetch is like require but does not raise if the key is not present
    #         images: params.fetch(:images, []) 
    #     )
    # end
end