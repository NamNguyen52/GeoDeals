class ChangeColumnTypeInLists < ActiveRecord::Migration
  def change

  	change_column :lists, :user_id, 'integer USING CAST(user_id AS integer)'

  end
end
