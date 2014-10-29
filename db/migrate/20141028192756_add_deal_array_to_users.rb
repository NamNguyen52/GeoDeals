class AddDealArrayToUsers < ActiveRecord::Migration
  def change
    add_column :users, :deals_array, :string, array: true, default: []
  end
end
