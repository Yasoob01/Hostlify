class CreateHostels < ActiveRecord::Migration[7.0]
  def change
    create_table :hostels do |t|
      t.string :name
      t.text :location
      t.integer :rooms_available
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
