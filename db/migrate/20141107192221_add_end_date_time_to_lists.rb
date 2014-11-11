class AddEndDateTimeToLists < ActiveRecord::Migration
  def change
    add_column :lists, :deal_end_datetime, :datetime
  end
end
