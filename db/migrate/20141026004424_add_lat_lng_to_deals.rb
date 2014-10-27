class AddLatLngToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :latitude, :float
    add_column :deals, :longitude, :float
  end
end
