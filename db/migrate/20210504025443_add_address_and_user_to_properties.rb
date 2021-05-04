class AddAddressAndUserToProperties < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :address, :string
    add_reference :properties, :user, null: false, foreign_key: true
  end
  def up
    add_column :properties, :address, :string
    add_reference :properties, :user, null: false, foreign_key: true
  end

  def down
    remove_column :properties, :address, :string
    remove_reference :properties, :user, null: false, foreign_key: true
  end
end
