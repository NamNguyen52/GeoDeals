class RemoveLongitudeFromDeals < ActiveRecord::Migration
  def change
    remove_column :deals, :longitude, :float
  end
end
