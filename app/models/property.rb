class Property < ApplicationRecord
    belongs_to :user
    has_many :bookings
    has_many :reviews, through: :bookings, dependent: :destroy
    has_many_attached :images
    validates :max_guests, presence: true
    validates :title, length: { maximum: 100 }, allow_blank: false, presence: true
    validates :description, length: { maximum: 250 }, allow_blank: false, presence: true
    validates :address, presence: true
    geocoded_by :address
    after_validation :geocode
end
