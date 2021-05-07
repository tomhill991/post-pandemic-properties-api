class Booking < ApplicationRecord
  belongs_to :property
  belongs_to :user
  has_one :review
  validates_date :date_start, after: -> { Date.current }, presence: true
  validates :no_of_guests, presence: true
  validate :overlapping_dates
  validate :guests_allowed

  private
  def overlapping_dates
    if Booking.where('? <  date_end and ? > date_start', self.date_start, self.date_end).any?
        errors.add(:date, 'This property is already booked during these dates')
    end
  end

  def guests_allowed
    if Property.find(self.property.id).max_guests < self.no_of_guests
      errors.add(:no_of_guests, 'You are booking too many people for this property')
    end
  end
end
