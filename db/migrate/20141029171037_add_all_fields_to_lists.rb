class AddAllFieldsToLists < ActiveRecord::Migration
  def change
    add_column :lists, :created_at, :string
    add_column :lists, :updated_at, :string
    add_column :lists, :user_id, :string
    add_column :lists, :deal_id, :string
    add_column :lists, :deal_name, :string
    add_column :lists, :deal_description, :string
    add_column :lists, :deal_code, :string
    add_column :lists, :deal_fine, :string
    add_column :lists, :deal_date, :string
    add_column :lists, :deal_time, :string
  end
end
