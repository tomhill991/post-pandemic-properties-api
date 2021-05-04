class Api::V1::PropertiesController < ApiController
    before_action :authenticate_user!, only: [:update, :create, :destroy]

    def index
        @properties = Property.all
        render json: @properties
    end

    def show
        @property = Property.find(params[:id])
        render json: @property
    end

end