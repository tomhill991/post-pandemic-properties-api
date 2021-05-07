class AddUniquenessToBookingIdOnReviews < ActiveRecord::Migration[6.1]
  def change
    def change
      add_index :reviews, :booking_id, unique: true
    end
  end
end
