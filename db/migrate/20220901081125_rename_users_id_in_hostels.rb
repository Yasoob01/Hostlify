class RenameUsersIdInHostels < ActiveRecord::Migration[7.0]
  def up
    rename_column :hostels, :users_id, :user_id
  end

  def down
    rename_column :hostels, :user_id, :users_id
  end
end