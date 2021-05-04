class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :title
      t.string :description
      t.integer :max_guests
      t.integer :price_per_day
      t.float :longitude
      t.float :latitude
      t.float :average_rating
      t.boolean :has_beach_nearby
      t.boolean :has_beds
      t.boolean :has_kitchen
      t.boolean :has_swimming_pool
      t.boolean :has_hdtv
      t.boolean :has_bathtub

      t.timestamps
    end
  end
end
