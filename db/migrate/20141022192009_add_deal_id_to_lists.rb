class AddDealIdToLists < ActiveRecord::Migration
  def change
  	add_column :lists, :deal_id, :integer
  end
end
