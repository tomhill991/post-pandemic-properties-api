class Booking < ApplicationRecord
  belongs_to :property
  belongs_to :user
  has_one :review
  # validates_date :date_start, after: -> { Date.current }, presence: true
  validates :no_of_guests, presence: true
end
