class MakeAverageRatingDefault1 < ActiveRecord::Migration[6.1]
  def self.up
    change_column :properties, :average_rating, :float, :default => 1
  end

  def self.down
    change_column :properties, :average_rating, :integer, :default => 0
  end
end
