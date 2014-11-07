class AddDateTimeToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :start_datetime, :datetime
    add_column :deals, :end_datetime, :datetime
  end
end
