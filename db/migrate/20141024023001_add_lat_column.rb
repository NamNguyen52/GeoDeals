class AddLatColumn < ActiveRecord::Migration
  def change
  	add_column :deals, :lat, :float
  end
end
