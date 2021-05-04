class Review < ApplicationRecord
    belongs_to :bookings
    validates :description, presence: true
    validates :ratings, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 5 }
end
