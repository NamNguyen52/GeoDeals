class RemoveLatitudeFromDeals < ActiveRecord::Migration
  def change
    remove_column :deals, :latitude, :float
  end
end
