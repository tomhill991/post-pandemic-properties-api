class Review < ApplicationRecord
    belongs_to :booking
    validates :description, presence: true
    validates :rating, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 5 }
end
