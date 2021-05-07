class Api::V1::BookingsController < ApiController
    before_action :authenticate_user!, only: [:index, :show, :update, :create, :destroy]

    def index
        if current_user === users_property
            @bookings = Booking.where(property_id: params[:property_id])

            render json: {
                bookings: @bookings
            }, status: 200
        else
            render json: {
                error: "You are not authorized to see the bookings for this property"
            }, status: 403
        end
    end

    def show
        if current_user === users_booking
            @booking = Booking.find(params[:id])

            render json: {
                booking: @booking
            }, status: 200
        else
            render json: {
                error: "You are not authorized to see this booking"
            }, status: 403
        end
    end

    def create
        if current_user == User.find(params[:user_id])
            @booking = Booking.new(booking_params)

            if @booking.save!
                render json: {
                    success: "Successfully created",
                    booking: @booking
                }, status: 200
            else
                render json: {
                    error: "There was an error when creating this booking",
                    booking: @booking.errors.full_messages
                }, status: 500
            end
        else
            render json: {
                error: "You are not authorized to create this booking"
            }, status: 403
        end
    end

    def update
        if current_user == User.find(params[:user_id])
            booking = Booking.find(params[:id])
            @booking = booking.update(booking_params)

            if @booking
                render json: {
                    success: "Successfully updated this booking",
                    booking: Booking.find(params[:id])
                }, status: 200
            else
                render json: {
                    error: "There was an error when updating this booking",
                    booking: booking.errors.full_messages
                }, status: 500
            end
        else
            render json: {
                error: "You are not authorized to update this booking"
            }, status: 403
        end
    end

    def destroy
        @booking = Booking.find(params[:id])

        if current_user === users_booking
            @booking.destroy

            render json: {
                success: "Successfully deleted this booking",
            }, status: 200
        else  
            render json: {
                error: "You are not authorized to delete this property"
            }, status: 403
        end
    end

    private
    def booking_params
        params.require(:booking).permit(:date_start, :date_end, :no_of_guests, :user_id, :property_id)
    end

    def users_property
        Property.find(params[:property_id]).user
    end

    def users_booking
        Booking.find(params[:id]).user
    end
end