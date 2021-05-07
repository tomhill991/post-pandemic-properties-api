class Review < ApplicationRecord
    has_one :property, through: :booking
    has_one :user, through: :booking
    belongs_to :booking
    validates_uniqueness_of :booking_id, :message => 'You are only allowed one review per booking'
    validates :description, presence: true
    validates :rating, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 5 } 
end
