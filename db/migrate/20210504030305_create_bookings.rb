class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :property, null: false, foreign_key: true
      t.date :date_start
      t.date :date_end
      t.integer :no_of_guests
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
