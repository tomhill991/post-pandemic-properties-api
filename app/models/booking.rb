class Booking < ApplicationRecord
  belongs_to :property
  belongs_to :user
  has_one :review
  validates_date :date_start, after: -> { Date.current }, presence: true
  validates :no_of_guests, presence: true
  validate :overlapping

  private
  def overlapping
    result = true

    if Booking.where('? <  date_end and ? > date_start', self.date_start, self.date_end).any?
        errors.add(:Date, 'This property is already booked during these dates')
        result = false
    end

    result
  end
end
