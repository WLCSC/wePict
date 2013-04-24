class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :assignable_id
			t.string :assignable_type
      t.integer :room_id

      t.timestamps
    end
  end
end
