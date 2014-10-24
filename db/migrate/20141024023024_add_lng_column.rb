class AddLngColumn < ActiveRecord::Migration
  def change
  	add_column :deals, :lng, :float
  end
end
