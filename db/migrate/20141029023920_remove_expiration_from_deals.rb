class RemoveExpirationFromDeals < ActiveRecord::Migration
  def change
  	remove_column :deals, :expired, :boolean
  end
end
