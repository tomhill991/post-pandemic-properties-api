class ReviewSerializer < ApplicationSerializer
  attributes :id, :description, :rating
  has_one :booking
end