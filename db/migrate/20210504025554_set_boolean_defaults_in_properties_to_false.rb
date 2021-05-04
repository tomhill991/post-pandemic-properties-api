class SetBooleanDefaultsInPropertiesToFalse < ActiveRecord::Migration[6.1]
    def up
      change_column :properties, :has_beach_nearby, :boolean, null: false, default: false
      change_column :properties, :has_beds, :boolean, null: false, default: false
      change_column :properties, :has_kitchen, :boolean, null: false, default: false
      change_column :properties, :has_swimming_pool, :boolean, null: false, default: false
      change_column :properties, :has_hdtv, :boolean, null: false, default: false
      change_column :properties, :has_bathtub, :boolean, null: false, default: false
    end

    def down
      change_column :properties, :has_beach_nearby, :boolean
      change_column :properties, :has_beds, :boolean
      change_column :properties, :has_kitchen, :boolean
      change_column :properties, :has_swimming_pool, :boolean
      change_column :properties, :has_hdtv, :boolean
      change_column :properties, :has_bathtub, :boolean
    end
end
