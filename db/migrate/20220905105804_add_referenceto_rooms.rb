class AddReferencetoRooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :rooms, :hostel_id
  end
end
