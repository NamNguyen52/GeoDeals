class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :location
      t.string :street
      t.string :ste
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
