class ChangeIdForDeals < ActiveRecord::Migration
  def change
  	remove_column :deals, :business_id
  end
end
