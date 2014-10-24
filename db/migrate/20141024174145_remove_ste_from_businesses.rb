class RemoveSteFromBusinesses < ActiveRecord::Migration
  def change
    remove_column :businesses, :ste, :string
  end
end
