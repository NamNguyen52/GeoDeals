class AddStuffToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :direction, :string
    add_column :deals, :latitude, :float
    add_column :deals, :longitude, :float
    add_column :deals, :start, :string
    add_column :deals, :expire, :string
    add_column :deals, :text, :string
    add_column :deals, :triggerid, :string
  end
end
