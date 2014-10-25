class RemoveStateFromBusinesses < ActiveRecord::Migration
  def change
    remove_column :businesses, :state, :string
  end
end
