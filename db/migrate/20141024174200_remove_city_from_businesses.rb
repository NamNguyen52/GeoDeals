class RemoveCityFromBusinesses < ActiveRecord::Migration
  def change
    remove_column :businesses, :city, :string
  end
end
