class AddFieldsToLists < ActiveRecord::Migration
  def change
    add_column :lists, :deal_name, :string
    add_column :lists, :deal_description, :string
    add_column :lists, :deal_code, :string
    add_column :lists, :deal_fine, :string
    add_column :lists, :deal_date, :date
    add_column :lists, :deal_time, :time
  end
end
