class RemoveAllFieldsFromLists < ActiveRecord::Migration
  def change
    remove_column :lists, :created_at, :string
    remove_column :lists, :updated_at, :string
    remove_column :lists, :user_id, :string
    remove_column :lists, :deal_id, :string
    remove_column :lists, :deal_name, :string
    remove_column :lists, :deal_description, :string
    remove_column :lists, :deal_code, :string
    remove_column :lists, :deal_fine, :string
    remove_column :lists, :deal_date, :string
    remove_column :lists, :deal_time, :string
  end
end
