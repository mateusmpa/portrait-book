class AddUserIdToPortraits < ActiveRecord::Migration
  def change
    add_column :portraits, :user_id, :integer
    add_index :portraits, :user_id
  end
end
