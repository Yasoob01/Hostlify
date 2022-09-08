class RemoveColumnFromRooms < ActiveRecord::Migration[7.0]
  def change
    remove_column :rooms, :hostel_id
  end
end
