class AddBusinessOwnerToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :business_owner, :boolean
  end
end
