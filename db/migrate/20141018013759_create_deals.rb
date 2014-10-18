class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.string :name
      t.string :description
      t.string :code
      t.string :fine
      t.date :start_date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.string :business_id

      t.timestamps
    end
  end
end
