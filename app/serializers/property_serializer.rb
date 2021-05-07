class PropertySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :max_guests, :price_per_day, :address, :longitude, :latitude, :average_rating, :has_beach_nearby, :has_beds, :has_kitchen, :has_swimming_pool, :has_hdtv, :has_bathtub, :images, :bookings

  def images
    if object.images.attachments
      image_urls = object.images.map do |image| 
        image.service_url
      end

      image_urls
    end
  end
end