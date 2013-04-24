class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :notes
      t.integer :user_id

      t.timestamps
    end
  end
end
