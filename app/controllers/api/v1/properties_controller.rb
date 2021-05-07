class Api::V1::PropertiesController < ApiController
    before_action :authenticate_user!, only: [:update, :create, :destroy]

    def index
        @properties = Property.all
        render json: @properties
    end

    def create
        if user_signed_in?
            @property = Property.new(property_params)
            @property.user_id = current_user.id
            @property.save!

            if @property.save
                render json: {
                    success: "Successfully created",
                    property: @property,
                }, status: 200
            else
                render json: {
                    error: "Error when creating this property",
                }, status: 500
            end
        else
            render json: {
                error: "You need to sign in to create a property",
            }, status: 403 
        end
    end

    def show
        @property = Property.find(params[:id])
        render json: @property
    end

    def update
        @property = Property.find(params[:id])
        if current_user === @property.user   
            property = @property.update(property_params)

            if property 
                render json: {
                    success: "Successfully updated",
                    property: @property,
                }, status: 200
            else
                render json: {
                    error: "Error when updating this property",
                }, status: 500
            end
        else
            render json: {
                error: "You are not authorized to update this property"
            }, status: 403
        end
    end

    def destroy
        @property = Property.find(params[:id])

        if current_user === @property.user
            @property.destroy

            render json: {
                success: "Successfully deleted this property",
            }, status: 200
        else  
            render json: {
                error: "You are not authorized to delete this property"
            }, status: 403
        end
    end

    private
    def property_params
        json = JSON.parse(params[:data])
        json = ActionController::Parameters.new(json)
        json.permit(
            :title, :description, :max_guests, 
            :price_per_day, :address, :average_rating, 
            :has_beach_nearby, :has_beds, :has_kitchen, 
            :has_swimming_pool, :has_hdtv, :has_bathtub
        ).merge(
            # fetch is like require but does not raise if the key is not present
            images: params.fetch(:images, []) 
        )
    end

    def is_conflict(start_date, end_date, property)
        check = property.bookings.where("? < start_date & end_date < ? ", start_date, end_date)
        check.size > 0 ? true : false
    end
end