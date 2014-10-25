class RemoveCountryFromBusinesses < ActiveRecord::Migration
  def change
    remove_column :businesses, :country, :string
  end
end
