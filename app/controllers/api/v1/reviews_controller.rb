class Api::V1::ReviewsController < ApiController
    before_action :authenticate_user!, only: [:update, :create, :destroy]

    def index
        @reviews = Property.find(params[:property_id]).reviews
        render json: { 
            reviews: @reviews 
        }, status: 200
    end

    def create
        if current_user === users_review
            @review = Review.new(review_params)
            @review.booking_id = params[:booking_id]

            if @review.save!
                render json: {
                    success: "Successfully created",
                    review: @review
                }, status: 200
            else
                render json: {
                    error: "There was an error when creating this review",
                    review: @review.errors.full_messages
                }, status: 500
            end
        else
            render json: {
                error: "You are not authorized to create this review"
            }, status: 403
        end
    end

    def update
        @review = Review.find(params[:id])
        if current_user === users_review   
            review = @review.update(review_params)

            if review 
                render json: {
                    success: "Successfully updated",
                    review: @review,
                }, status: 200
            else
                render json: {
                    error: "Error when updating this property",
                    message: @review.errors.full_messages
                }, status: 500
            end
        else
            render json: {
                error: "You are not authorized to update this property"
            }, status: 403
        end
    end

    def destroy
        @review = Review.find(params[:id])

        if current_user === users_review
            @review.destroy

            render json: {
                success: "Successfully deleted this review",
            }, status: 200
        else  
            render json: {
                error: "You are not authorized to delete this review"
            }, status: 403
        end
    end

    private
    def review_params
        params.require(:review).permit(:rating, :description, params[:booking_id])
    end

    def users_review
        Property.find(params[:property_id]).user
    end
end