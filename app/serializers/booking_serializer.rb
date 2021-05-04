class BookingSerializer < ApplicationSerializer
  attributes :id, :date_start, :date_end, :no_of_guests
  has_one :property
  has_one :user
end