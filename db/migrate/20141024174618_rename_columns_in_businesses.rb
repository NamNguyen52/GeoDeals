class RenameColumnsInBusinesses < ActiveRecord::Migration
  def change
  	rename_column :businesses, :lat, :latitude
  	rename_column :businesses, :lng, :longitude
  end
end
