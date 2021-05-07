class BookingSerializer < ApplicationSerializer
  attributes :id, :date_start, :date_end, :no_of_guests, :property
  belongs_to :property
  belongs_to :user
end