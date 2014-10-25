class RemoveColumnsFromDeals < ActiveRecord::Migration
  def change
    remove_column :deals, :lat, :float
    remove_column :deals, :lng, :float
    
  end
end
