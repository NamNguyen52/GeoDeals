class RemoveColumnsFromDeals < ActiveRecord::Migration
  def change
    remove_column :deals, :start, :string
    remove_column :deals, :expire, :string
    remove_column :deals, :triggerid, :string
    remove_column :deals, :distance, :string
    remove_column :deals, :direction, :string
    remove_column :deals, :lat, :float
    remove_column :deals, :lng, :float
    remove_column :deals, :text, :string
  end
end
