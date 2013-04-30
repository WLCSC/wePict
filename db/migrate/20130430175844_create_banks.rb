class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.integer :room_id
      t.string :name
      t.text :notes

      t.timestamps
    end
  end
end
