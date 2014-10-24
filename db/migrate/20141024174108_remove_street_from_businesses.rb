class RemoveStreetFromBusinesses < ActiveRecord::Migration
  def change
    remove_column :businesses, :street, :string
  end
end
