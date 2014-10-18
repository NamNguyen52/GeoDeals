class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :deal_id
      t.string :user_id

      t.timestamps
    end
  end
end
