class ChangeIdForLists < ActiveRecord::Migration
  def change
  	remove_column :lists, :user_id
  	remove_column :lists, :deal_id
  end
end
