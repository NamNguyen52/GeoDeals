class AddExpirationToDeals < ActiveRecord::Migration
  def change
  	add_column :deals, :expired, :boolean
  end
end
