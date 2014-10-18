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
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
