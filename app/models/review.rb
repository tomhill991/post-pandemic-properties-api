class Review < ApplicationRecord
    has_one :property, through: :booking
    has_one :user, through: :booking
    belongs_to :booking
    validates_uniqueness_of :booking_id, :message => 'You are only allowed one review per booking'
    validates :description, presence: true
    validates :rating, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 5 } 
    after_commit :update_average_rating
    validate :added_after_booking_date?

    private
    def update_average_rating
        property = self.booking.property
        property.average_rating = property.reviews.average(:rating).round(2)
        property.save!
    end

    def added_after_booking_date?
        booking = self.booking

        if booking.date_end.to_date < Date.today
            errors.add(:date_end, 'You cannot add a review until you have left the accommodation!')
        end
    end
end
