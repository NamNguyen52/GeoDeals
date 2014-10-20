class AddDistanceToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :distance, :integer
  end
end
