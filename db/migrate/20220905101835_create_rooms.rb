class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.integer :hostel_id
      t.boolean :airconditioned
      t.boolean :wifi
      t.boolean :tv
      t.boolean :attached_bath
      t.boolean :fridge
      t.integer :room_capacity

      t.timestamps
    end
  end
end
