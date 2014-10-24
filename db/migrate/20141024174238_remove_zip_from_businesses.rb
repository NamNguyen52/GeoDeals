class RemoveZipFromBusinesses < ActiveRecord::Migration
  def change
    remove_column :businesses, :zip, :integer
  end
end
