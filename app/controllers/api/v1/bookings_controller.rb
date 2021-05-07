class Api::V1::BookingsController < ApiController
    before_action :authenticate_user!, only: [:index, :show, :update, :create, :destroy]

    def index
        if current_user === users_property
            @bookings = Booking.where(property_id: params[:property_id])

            render json: {
                bookings: @bookings
            }
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
            }
        else
            render json: {
                error: "You are not authorized to see this booking"
            }, status: 403
        end
    end

    def create
        if current_user == User.find(params[:user_id])
            @booking = Booking.new(booking_params)
            @booking.save!

            render json: {
                success: "Successfully create this booking",
                booking: @booking
            }
        else
            render json: {
                error: "You are not authorized to create this booking"
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