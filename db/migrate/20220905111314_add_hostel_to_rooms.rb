class AddHostelToRooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :rooms, :hostel, null: false, foreign_key: true
  end
end
