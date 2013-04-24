class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :room_id
      t.text :data

      t.timestamps
    end
  end
end
