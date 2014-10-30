class RemoveLatLngFromDeals < ActiveRecord::Migration
  def change
    remove_column :deals, :latitude, :string
    remove_column :deals, :longitude, :string
  end
end
