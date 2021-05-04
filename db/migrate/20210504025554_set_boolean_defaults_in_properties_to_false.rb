class SetBooleanDefaultsInPropertiesToFalse < ActiveRecord::Migration[6.1]
  def change
    change_column :properties, :has_beach_nearby, :boolean, null: false, default: false
    change_column :properties, :has_beds, :boolean, null: false, default: false
    change_column :properties, :has_kitchen, :boolean, null: false, default: false
    change_column :properties, :has_swimming_pool, :boolean, null: false, default: false
    change_column :properties, :has_hdtv, :boolean, null: false, default: false
    change_column :properties, :has_bathtub, :boolean, null: false, default: false
  end
end
